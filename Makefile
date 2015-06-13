.PHONY: all clean install

CC=gcc
CFLAGS=-pipe -Wall -O2
LDFLAGS=-lm

LIBS = libilbc.so libilbc.a
CSOURCES = $(subst iLBC_test.c,,$(wildcard *.c))
CHEADERS = $(wildcard *.h)
OBJECTS = $(patsubst %.c,%.o,$(CSOURCES))

ARCH=$(shell uname -m)

ifeq ($(ARCH),x86_64)
CFLAGS+=-fPIC
endif

all: $(LIBS)

clean:
	$(RM) $(LIBS) $(OBJECTS)
	$(RM) *% *~ core

libilbc.a: $(OBJECTS)
	$(AR) rcs $@ $^
	ranlib $@

libilbc.so: $(OBJECTS)
	$(CC) $(CFLAGS) $(LDFLAGS) -fPIC -shared -o $@ $^

install: all
	install -d $(DESTDIR)/usr/lib
	install libilbc.so $(DESTDIR)/usr/lib
	install libilbc.a $(DESTDIR)/usr/lib
	install -d $(DESTDIR)/usr/include/ilbc
	install ${CHEADERS} $(DESTDIR)/usr/include/ilbc
