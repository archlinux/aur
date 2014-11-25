# Simple Makefile to ease the compilation of flv2mpeg4
# Olivier Mehani <shtrom-aur@ssji.net>
# 
CFLAGS+=-I/usr/include/ffmpeg -L/usr/lib
LDFLAGS+=-lavformat -lavcodec -lavutil

all: flv2mpeg4
install: flv2mpeg4
	install -D -m 0755 flv2mpeg4 $(DESTDIR)/usr/bin/flv2mpeg4

flv2mpeg4_SOURCES=avformat_writer.c \
		  dcprediction.c \
		  flv2mpeg4.c \
		  fetch.c \
		  flvdecoder.c \
		  m4vencode.c \
		  mp3header.c

flv2mpeg4: $(flv2mpeg4_SOURCES:.c=.o)

clean:
	rm -f $(flv2mpeg4_SOURCES:.c=.o)
	rm -f flv2mpeg4

.PHONY: all install clean
