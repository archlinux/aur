SRCDIR?=freebsd-src
INSTALL?=/usr/bin/install
INSTALL_PROGRAM=$(INSTALL) -Dm755
INSTALL_DATA=$(INSTALL) -Dm644
bindir=/usr/bin/
man1dir=/usr/share/man/man1/
CFLAGS+= -include linux_compat.h

all: bsdsed

bsdsed: $(SRCDIR)/usr.bin/sed/compile.o \
	$(SRCDIR)/usr.bin/sed/main.o \
	$(SRCDIR)/usr.bin/sed/misc.o \
	$(SRCDIR)/usr.bin/sed/process.o \
	$(SRCDIR)/lib/libc/string/strlcat.o \
	$(SRCDIR)/lib/libc/string/strlcpy.o \
	errc.o
	$(CC) $(CFLAGS) $(LDFLAGS) -o bsdsed $^

bsdsed.1:
	@sed 's/\bsed/bsdsed/;s/\bSED/BSDSED/;s/GNU bsd/GNU /' $(SRCDIR)/usr.bin/sed/sed.1 > bsdsed.1

install: bsdsed bsdsed.1
	$(INSTALL_PROGRAM) -t $(DESTDIR)$(bindir) bsdsed
	$(INSTALL_DATA) -t $(DESTDIR)$(man1dir) bsdsed.1
