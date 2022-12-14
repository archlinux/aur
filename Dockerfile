FROM debian:oldstable

RUN apt-get -y update
RUN apt-get -y install python2 inkscape wget
RUN wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
RUN python2 get-pip.py
RUN python2 -m pip install pillow

WORKDIR /app/src/cursors

COPY ./makepngs.sh /

ENTRYPOINT bash /makepngs.sh 
