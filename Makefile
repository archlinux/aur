# Copyright (C) 2002-2005 Ghostgum Software Pty Ltd.  All rights reserved.
#
#  This software is provided AS-IS with no warranty, either express or
#  implied.
#
#  This software is distributed under licence and may not be copied,
#  modified or distributed except as expressly authorised under the terms
#  of the licence contained in the file LICENCE in this distribution.
#
#  For more information about licensing, please refer to
#  http://www.ghostgum.com.au/ or contact Ghostsgum Software Pty Ltd, 
#  218 Gallaghers Rd, Glen Waverley VIC 3150, AUSTRALIA, 
#  Fax +61 3 9886 6616.
#

# $Id: epstool.mak,v 1.9 2005/03/25 03:37:59 ghostgum Exp $
# Make epstool for GNU/Linux

BINDIR=./bin
OBJDIR=./epsobj
SRCDIR=./src
SRCWINDIR=./srcwin

XINCLUDE=
PFLAGS=
PLINK=

GTKCFLAGS=
GTKLIBS=

LIBPNGINC=
LIBPNGCFLAGS=
LIBPNGLIBS=

LONGFILEDEF=
LONGFILEMOD=cfile

include $(SRCDIR)/unixcom.mak

EPSOBJPLAT=$(OD)xnodll$(OBJ) $(OD)$(LONGFILEMOD)$(OBJ)
EPSLIB=$(LIBPNGLIBS)

BEGIN=$(OD)lib.rsp
TARGET=epstool

include $(SRCDIR)/common.mak

EPSTOOL_ROOT=/usr
EPSTOOL_BASE=$(prefix)$(EPSTOOL_ROOT)
EPSTOOL_DOCDIR=$(EPSTOOL_BASE)/share/doc/epstool-$(EPSTOOL_VERSION)
EPSTOOL_MANDIR=$(EPSTOOL_BASE)/share/man
EPSTOOL_BINDIR=$(EPSTOOL_BASE)/bin

epstool: $(BD)epstool$(EXE)

epstest: epstool $(BD)epstest$(EXE)
	$(BD)epstest$(EXE)

$(OD)lib.rsp: makefile
	-mkdir $(BINDIR)
	-mkdir $(OBJDIR)
	echo "dummy" > $(OD)lib.rsp

install: $(TARGET)
	-mkdir -p $(EPSTOOL_BASE)
	chmod a+rx $(EPSTOOL_BASE)
	-mkdir -p $(EPSTOOL_BINDIR)
	chmod a+rx $(EPSTOOL_BINDIR)
	$(INSTALL_EXE) $(BD)epstool$(EXE) $(EPSTOOL_BINDIR)$(DD)epstool$(EXE)
	-strip  $(EPSTOOL_BINDIR)$(DD)epstool$(EXE)
	-mkdir -p $(EPSTOOL_MANDIR)
	chmod a+rx $(EPSTOOL_MANDIR)
	-mkdir -p $(EPSTOOL_MANDIR)$(DD)man1
	chmod a+rx $(EPSTOOL_MANDIR)$(DD)man1
	$(INSTALL) doc$(DD)epstool.1 $(EPSTOOL_MANDIR)$(DD)man1$(DD)epstool.1
	-mkdir -p $(EPSTOOL_DOCDIR)
	chmod a+rx $(EPSTOOL_DOCDIR)
	$(INSTALL) doc$(DD)epstool.htm $(EPSTOOL_DOCDIR)$(DD)epstool.htm
	$(INSTALL) doc$(DD)gsview.css $(EPSTOOL_DOCDIR)$(DD)gsview.css
	$(INSTALL) LICENCE $(EPSTOOL_DOCDIR)$(DD)LICENCE


CYGWIN_DISTDIR=./dist
CYGWIN_PACKAGE=epstool-$(EPSTOOL_VERSION)-1
CYGWIN_DOCDIR=$(CYGWIN_DISTDIR)/usr/share/doc/Cygwin
cygwin:
	rm -rf $(CYGWIN_DISTDIR)/*
	$(MAKE) -f src/epstool.mak prefix=$(CYGWIN_DISTDIR) EXE=.exe EPSTOOL_ROOT=/usr EPSTOOL_MANDIR=$(CYGWIN_DISTDIR)/usr/share/man install 
	-mkdir -p $(CYGWIN_DOCDIR)
	chmod a+rx $(CYGWIN_DOCDIR)
	$(INSTALL) doc/cygwin.README $(CYGWIN_DOCDIR)$(DD)epstool-$(EPSTOOL_VERSION).README
	(cd $(CYGWIN_DISTDIR); tar -cjf ../$(CYGWIN_PACKAGE).tar.bz2 *)
	rm -rf $(CYGWIN_DISTDIR)/*
	mv $(CYGWIN_PACKAGE).tar.bz2 $(CYGWIN_DISTDIR)
	cp doc/cygwin.hint $(CYGWIN_DISTDIR)/setup.hint
	make -f src/epstool.mak EXE=.exe EPSDIST=$(CYGWIN_PACKAGE) $(EPSTAR)
	mv $(EPSTAR) $(CYGWIN_DISTDIR)/$(CYGWIN_PACKAGE)-src.tar
	bzip2 $(CYGWIN_DISTDIR)/$(CYGWIN_PACKAGE)-src.tar

clean:
	-$(RM) $(EPSOBJS)
	-$(RM) $(EPSTESTOBJS)
	-$(RM) $(OD)lib.rsp
	-$(RM) $(BD)epstool$(EXE)
	-$(RM) $(BD)epstest$(EXE)
	-rmdir $(OBJDIR)

