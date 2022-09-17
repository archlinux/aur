#
# Makefile for the HPLIP Printer Application
#
# Copyright © 2020-2021 by Till Kamppeter
# Copyright © 2020 by Michael R Sweet
#
# Licensed under Apache License v2.0.  See the file "LICENSE" for more
# information.
#

# Version and
VERSION		=	1.0
prefix		=	/usr
sysconfdir	=	/etc
localstatedir	=	/var
includedir	=	$(prefix)/include
bindir		=	$(prefix)/bin
libdir		=	$(prefix)/lib
mandir		=	$(prefix)/share/man
ppddir		=	$(prefix)/share/ppd
statedir	=	$(localstatedir)/lib/hplip-printer-app
spooldir	=	$(localstatedir)/spool/hplip-printer-app
serverbin	=	$(prefix)/lib/hplip-printer-app
resourcedir	=	$(prefix)/share/hplip-printer-app
cupsserverbin	=	`cups-config  --serverbin`
unitdir 	=	`pkg-config --variable=systemdsystemunitdir systemd`
HPLIP_CONF_DIR  =       $(sysconfdir)/hp
HPLIP_PLUGIN_STATE_DIR = $(localstatedir)/lib/hp

# Compiler/linker options...
OPTIM		=	-Os -g
DIRS		=	-DHPLIP_CONF_DIR=\"$(HPLIP_CONF_DIR)\" -DHPLIP_PLUGIN_STATE_DIR=\"$(HPLIP_PLUGIN_STATE_DIR)\"
ifdef HPLIP_PLUGIN_ALT_DIR
DIRS		+=	-DHPLIP_PLUGIN_ALT_DIR=\"$(HPLIP_PLUGIN_ALT_DIR)\"
endif
CFLAGS		+=	`pkg-config --cflags libpappl-retrofit` `pkg-config --cflags libppd` `pkg-config --cflags libcupsfilters` `pkg-config --cflags libfontembed` `pkg-config --cflags pappl` `cups-config --cflags` `pkg-config --cflags libcurl` `pkg-config --cflags libcrypto` $(DIRS) $(OPTIM)
ifdef SNAP
CFLAGS		+=	-DSNAP=$(SNAP)
endif
LDFLAGS		+=	$(OPTIM) `cups-config --ldflags`
LIBS		+=	$(PAPPL-RETROFIT) $(PPD) $(CUPS-FILTERS) $(FONTEMBED) $(PAPPL) -lcups -lcurl -lcrypto -lavahi-common -lavahi-client -ljpeg -lpam -lusb-1.0 -ldbus-1 -lm -lpng -ltiff -lqpdf -llcms2 -lpoppler-cpp -lfontconfig -lexif -lstdc++


# Targets...
OBJS		=	hplip-printer-app.o
TARGETS		=	hplip-printer-app


# General build rules...
.SUFFIXES:	.c .o
.c.o:
	$(CC) $(CFLAGS) -c -o $@ $<


# Targets...
all:		$(TARGETS)

clean:
	rm -f $(TARGETS) $(OBJS)

install:	$(TARGETS)
	mkdir -p $(DESTDIR)$(bindir)
	cp $(TARGETS) $(DESTDIR)$(bindir)
	mkdir -p $(DESTDIR)$(mandir)/man1
	cp hplip-printer-app.1 $(DESTDIR)$(mandir)/man1
	mkdir -p $(DESTDIR)$(ppddir)
	mkdir -p $(DESTDIR)$(statedir)/ppd
	mkdir -p $(DESTDIR)$(spooldir)
	mkdir -p $(DESTDIR)$(resourcedir)
	cp testpage.ps $(DESTDIR)$(resourcedir)
	if test "x$(cupsserverbin)" != x && [ -d $(cupsserverbin) ]; then \
	  mkdir -p $(DESTDIR)$(libdir); \
	  touch $(DESTDIR)$(serverbin) 2> /dev/null || :; \
	  if rm $(DESTDIR)$(serverbin) 2> /dev/null; then \
	    ln -s $(cupsserverbin) $(DESTDIR)$(serverbin); \
	  fi; \
	  mkdir -p $(DESTDIR)$(cupsserverbin)/backend; \
	  cp HP $(DESTDIR)$(cupsserverbin)/backend; \
	else \
	  mkdir -p $(DESTDIR)$(serverbin)/filter; \
	  mkdir -p $(DESTDIR)$(serverbin)/backend; \
	  cp HP $(DESTDIR)$(serverbin)/backend; \
	fi
	if test "x$(unitdir)" != x; then \
	  mkdir -p $(DESTDIR)$(unitdir); \
	  cp hplip-printer-app.service $(DESTDIR)$(unitdir); \
	fi

hplip-printer-app:	$(OBJS)
	$(CC) $(LDFLAGS) -o $@ $(OBJS) $(LIBS)

$(OBJS):	Makefile
