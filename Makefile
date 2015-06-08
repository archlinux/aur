CC?=gcc
LD?=gcc
CFLAGS+=-Wall -Os -pedantic -Werror
CSTD?=-std=c99
CSHAREFLAG+=-fpic -fno-stack-protector
INCLUDES?=-I$(JAVA_HOME)/include -I$(JAVA_HOME)/include/linux

LDVER?=$(shell ld -v | cut -d' ' -f1)

ifeq ($(LDVER),GNU)
LDSHAREFLAGS+=-fpic -shared
else
LDSHAREFLAGS+=-lc
endif

PREFIX?=/usr
JARDIR?=$(PREFIX)/share/java/libmatthew-java/
DOCDIR?=$(PREFIX)/share/doc/libmatthew-java/
LIBDIR?=$(PREFIX)/lib/

MATTVER=0.8

DEBUG?=disable

all: libcgi-java.so libunix-java.so

clean:
	rm -f *.o *.so

%.o: %.c %.h
	$(CC) $(CFLAGS) $(CSTD) $(CSHAREFLAG) $(INCLUDES) -c -o $@ $<
lib%.so: %.o
	$(CC) $(LDFLAGS) $(LDSHAREFLAGS) -o $@ $<
