FROM debian:stretch

RUN apt-get update && apt-get install -y unzip wget tar ca-certificates git build-essential
run mkdir /sources
ADD docker /sources
RUN mv /sources/go /go
RUN mkdir -p /opt/go && cp -r /go /opt/go/go1.13
RUN mv /sources/skycoin* /sources/skycoin
RUN cd /opt/go/go1.13/src && GOROOT_BOOTSTRAP=/go ./make.bash

ENV PATH "/opt/go/go1.13/bin:$PATH"

RUN mkdir -p /home/skycoin/go/src/github.com/skycoin/
RUN cp -r /sources/skycoin /home/skycoin/go/src/github.com/skycoin/skycoin
RUN rm -rf /sources
RUN cd /home/skycoin/go/src/github.com/skycoin/skycoin

ENV GOPATH /home/skycoin/go

ENTRYPOINT ["go"]
