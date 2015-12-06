#
# pidgin-quote-text Makefile
#
# Copyright 2015 Glinsky Vladislav <cl0ne[at]mithril.org.ua>
#
# Copied from:
# Pidgin-Latex Plugin Makefile
# Copyright 2004-2009 Edouard Geuten <thegrima AT altern DOT org>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#

CC := gcc
LIBTOOL := libtool

ifeq ($(DESTDIR),)
    LIB_INSTALL_DIR = $(HOME)/.purple/plugins
else
    LIB_INSTALL_DIR = $(DESTDIR)/lib/pidgin
endif

PIDGIN_QUOTE = quote_text

GTK_CFLAGS	= $(shell pkg-config gtk+-2.0 --cflags)
GTK_LIBS	= $(shell pkg-config gtk+-2.0 --libs)

PIDGIN_CFLAGS	= $(shell pkg-config pidgin --cflags)
PIDGIN_LIBS	= $(shell pkg-config pidgin --libs)
PIDGIN_LIBDIR	= $(shell pkg-config --variable=libdir pidgin)/pidgin

all: $(PIDGIN_QUOTE).so

install: all
	mkdir -p $(LIB_INSTALL_DIR)
	cp $(PIDGIN_QUOTE).so $(LIB_INSTALL_DIR)

$(PIDGIN_QUOTE).so: $(PIDGIN_QUOTE).o
	$(CC) $(LDFLAGS) -shared $(CFLAGS) $< -o $@ $(PIDGIN_LIBS) $(GTK_LIBS) -Wl,--export-dynamic -Wl,-soname

$(PIDGIN_QUOTE).o:$(PIDGIN_QUOTE).c
	$(CC) $(CFLAGS) -fPIC -c $< -o $@ $(PIDGIN_CFLAGS) $(GTK_CFLAGS)

clean:
	rm -rf *.o *.c~ *.h~ *.so *.la .libs
