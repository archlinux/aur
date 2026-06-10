PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin

CFLAGS += -O2 -Wall
LDFLAGS +=

all: vtlock

vtlock: vtlock.c
	$(CC) $(CFLAGS) -o vtlock vtlock.c $(LDFLAGS)

install: vtlock
	install -Dm 755 vtlock $(DESTDIR)$(BINDIR)/vtlock

clean:
	rm -f vtlock
