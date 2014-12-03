FROM ubuntu
MAINTAINER Venkat Peri <venkatperi@gmail.com>

ENV _USERID 21000
ENV _GROUPID 21000
ENV _USERNAME service
ENV _GROUPNAME service

RUN apt-get update && \
    apt-get install -y supervisor

COPY usr/bin/baseimage-preinit /usr/bin/
RUN /usr/bin/baseimage-preinit && \
    rm -f /usr/bin/baseimage-preinit

COPY usr/bin/baseimage-start /usr/bin/
COPY usr/bin/baseimage-runtime-init /usr/bin/
COPY usr/bin/baseimage-update-user /usr/bin/
COPY etc/supervisor/supervisord.conf /etc/supervisor/

CMD /usr/bin/baseimage-start
