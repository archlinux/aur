# Makefile for Away

# files and paths
SHELL  = /bin/sh
PREFIX = /usr
BINARY = away
SRC    = $(BINARY).c

# compiler
CC     = gcc
CFLAGS := -g -Wall -D_REENTRANT $(CFLAGS) $(CPPFLAGS)
LIBS   = $(LDFLAGS) -lpthread -lpam -lpam_misc

# alias away
all: $(BINARY)

# away
$(BINARY): $(SRC)
	$(CC) $(CFLAGS) $(SRC) $(LIBS) -o $(BINARY)
#	@strip $(BINARY)

# make install
install: $(BINARY)
	install -D -m755 -t $(DESTDIR)/$(PREFIX)/bin away
	install -D -m644 -t $(DESTDIR)/$(PREFIX)/share/doc/away/examples data/awayrc
	install -D -m644 -t $(DESTDIR)/$(PREFIX)/share/man/man1 doc/away.1
	install -D -m644 -t $(DESTDIR)/$(PREFIX)/share/man/man5 doc/awayrc.5
	install -D -m644 data/away.pam $(DESTDIR)/etc/pam.d/away

# Clean up
clean:
	rm -f $(BINARY) *.o core
