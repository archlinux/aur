# /***********************************************************
# Copyright 1991 by Stichting Mathematisch Centrum, Amsterdam, The
# Netherlands.
#
#                         All Rights Reserved
#
# Permission to use, copy, modify, and distribute this software and its
# documentation for any purpose and without fee is hereby granted,
# provided that the above copyright notice appear in all copies and that
# both that copyright notice and this permission notice appear in
# supporting documentation, and that the names of Stichting Mathematisch
# Centrum or CWI not be used in advertising or publicity pertaining to
# distribution of the software without specific, written prior permission.
#
# STICHTING MATHEMATISCH CENTRUM DISCLAIMS ALL WARRANTIES WITH REGARD TO
# THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
# FITNESS, IN NO EVENT SHALL STICHTING MATHEMATISCH CENTRUM BE LIABLE
# FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT
# OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#
# ******************************************************************/

# Makefile for Python
# ===================
#
# If you are in a hurry, you can just edit this Makefile to choose the
# correct settings for SYSV and RANLIB below, and type "make" in this
# directory.  If you are using a recent version of SunOS (or Ultrix?)
# you don't even have to edit: the Makefile comes pre-configured for
# such systems with all configurable options turned off, building the
# minimal portable version of the Python interpreter.
#
# If have more time, read the section on configurable options below.
# It may still be wise to begin building the minimal portable Python,
# to see if it works at all, and select options later.  You don't have
# to rebuild all objects when you turn on options; all dependencies
# are concentrated in the file "config.c" which is rebuilt whenever
# the Makefile changes.  (Except if you turn on the GNU Readline option
# you may have to toss out the tokenizer.o object.)


# Operating System Defines (ALWAYS READ THIS)
# ===========================================

# Uncomment the following line if you are using a System V derivative.
# This must be used, for instance, on an SGI IRIS.  Don't use it for
# SunOS.  (This is only needed by posixmodule.c...)

#SYSVDEF=      -DSYSV

# Choose one of the following two lines depending on whether your system
# requires the use of 'ranlib' after creating a library, or not.

#RANLIB =      true    # For System V
RANLIB =       ranlib  # For BSD

# If your system doesn't have symbolic links, uncomment the following
# line.

#NOSYMLINKDEF= -DNO_LSTAT


# You may want to change DEFPYTHONPATH to reflect where you install the
# Python module library.  The default contains "../lib" so running
# the interpreter from the source/build directory as distributed will
# find the library (admittedly a hack).
DEFPYTHONPATH=        .:/usr/lib/python0.9
# DEFPYTHONPATH=        .:/usr/lib/python0.9:../lib


# For "Pure" BSD Systems
# ======================
#
# "Pure" BSD systems (as opposed to enhanced BSD derivatives like SunOS)
# often miss certain standard library functions.  Source for
# these is provided, you just have to turn it on.  This may work for
# other systems as well, where these things are needed.

# If your system does not have a strerror() function in the library,
# uncomment the following two lines to use one I wrote.  (Actually, this
# is missing in most systems I have encountered, so it is turned on
# in the Makefile.  Turn it off if your system doesn't have sys_errlist.)

# Following two lines commented out by Andrew Dalke, 27 March 2009
#STRERROR_SRC=  strerror.c
#STRERROR_OBJ=  strerror.o

# If your BSD system does not have a fmod() function in the library,
# uncomment the following two lines to use one I wrote.

#FMOD_SRC=  fmod.c
#FMOD_OBJ=  fmod.o

# If your BSD system does not have a strtol() function in the library,
# uncomment the following two lines to use one I wrote.

#STRTOL_SRC=  strtol.c
#STRTOL_OBJ=  strtol.o

# If your BSD system does not have a getcwd() function in the library,
# but it does have a getwd() function, uncomment the following two lines
# to use one I wrote.  (If you don't have getwd() either, turn on the
# NO_GETWD #define in getcwd.c.)

#GETCWD_SRC=  getcwd.c
#GETCWD_OBJ=  getcwd.o

# If your signal() function believes signal handlers return int,
# uncomment the following line.

#SIGTYPEDEF=   -DSIGTYPE=int


# Further porting hints
# =====================
#
# If you don't have the header file <string.h>, but you do have
# <strings.h>, create a file "string.h" in this directory which contains
# the single line "#include <strings.h>", and add "-I." to CFLAGS.
# If you don't have the functions strchr and strrchr, add definitions
# "-Dstrchr=index -Dstrrchr=rindex" to CFLAGS.  (NB: CFLAGS is not
# defined in this Makefile.)


# Configurable Options
# ====================
#
# Python can be configured to interface to various system libraries that
# are not available on all systems.  It is also possible to configure
# the input module to use the GNU Readline library for interactive
# input.  For each configuration choice you must uncomment the relevant
# section of the Makefile below.  Note: you may also have to change a
# pathname and/or an architecture identifier that is hardcoded in the
# Makefile.
#
# Read the comments to determine if you can use the option.  (You can
# always leave all options off and build a minimal portable version of
# Python.)


# BSD Time Option
# ===============
#
# This option does not add a new module but adds two functions to
# an existing module.
#
# It implements time.millisleep() and time.millitimer()
# using the BSD system calls select() and gettimeofday().
#
# Uncomment the following line to select this option.

#BSDTIMEDEF=   -DBSD_TIME


# GNU Readline Option
# ===================
#
# If you have the sources of the GNU Readline library you can have
# full interactive command line editing and history in Python.
# The GNU Readline library is distributed with the BASH shell
# (I only know of version 1.05).  You must build the GNU Readline
# library and the alloca routine it needs in their own source
# directories (which are subdirectories of the basg source directory),
# and plant a pointer to the BASH source directory in this Makefile.
#
# Uncomment and edit the following block to use the GNU Readline option.
# - Edit the definition of BASHDIR to point to the bash source tree.
# You may have to fix the definition of LIBTERMCAP; leave the LIBALLOCA
# definition commented if alloca() is in your C library.

RLDIR=         ../../readline-8.1
TCDIR=         ../../termcap-1.3.1
LIBREADLINE=   $(RLDIR)/libreadline.a
LIBTERMCAP=    $(TCDIR)/libtermcap.a
RL_USE =       -DUSE_READLINE
RL_LIBS=       $(LIBREADLINE) $(LIBALLOCA) $(LIBTERMCAP)
RL_LIBDEPS=    $(LIBREADLINE) $(LIBALLOCA)


# STDWIN Option
# =============
#
# If you have the sources of STDWIN (by the same author) you can
# configure Python to incorporate the built-in module 'stdwin'.
# This requires a fairly recent version of STDWIN (dated late 1990).
#
# Uncomment and edit the following block to use the STDWIN option.
# - Edit the STDWINDIR defition to reflect the top of the STDWIN source
#   tree.
# - Edit the ARCH definition to reflect your system's architecture
#   (usually the program 'arch' or 'machine' returns this).
# You may have to edit the LIBX11 defition to reflect the location of
# the X11 runtime library if it is non-standard.

#STDWINDIR=    ../../stdwin
#ARCH=         sgi
#LIBSTDWIN=    $(STDWINDIR)/Build/$(ARCH)/x11/lib/lib.a
#LIBX11 =      -lX11
#STDW_INCL=    -I$(STDWINDIR)/H
#STDW_USE=     -DUSE_STDWIN
#STDW_LIBS=    $(LIBSTDWIN) $(LIBX11)
#STDW_LIBDEPS= $(LIBSTDWIN)
#STDW_SRC=     stdwinmodule.c
#STDW_OBJ=     stdwinmodule.o


# Amoeba Option
# =============
#
# If you have the Amoeba 4.0 distribution (Beta or otherwise) you can
# configure Python to incorporate the built-in module 'amoeba'.
# (Python can also be built for native Amoeba, but it requires more
# work and thought.  Contact the author.)
#
# Uncomment and edit the following block to use the Amoeba option.
# - Edit the AMOEBADIR defition to reflect the top of the Amoeba source
#   tree.
# - Edit the AM_CONF definition to reflect the machine/operating system
#   configuration needed by Amoeba (this is the name of a subdirectory
#   of $(AMOEBADIR)/conf/unix, e.g., vax.ultrix).

#AMOEBADIR=    /usr/amoeba
#AM_CONF=      mipseb.irix
#LIBAMUNIX=    $(AMOEBADIR)/conf/unix/$(AM_CONF)/lib/amunix/libamunix.a
#AM_INCL=      -I$(AMOEBADIR)/src/h
#AM_USE =      -DUSE_AMOEBA
#AM_LIBDEPS=   $(LIBAMUNIX)
#AM_LIBS=      $(LIBAMUNIX)
#AM_SRC =      amoebamodule.c sc_interpr.c sc_errors.c
#AM_OBJ =      amoebamodule.o sc_interpr.o sc_errors.o


# Silicon Graphics IRIS Options
# =============================
#
# The following three options are only relevant if you are using a
# Silicon Graphics IRIS machine.  These have been tested with IRIX 3.3.1
# on a 4D/25.


# GL Option
# =========
#
# This option incorporates the built-in module 'gl', which provides a
# complete interface to the Silicon Graphics GL library.  It adds
# about 70K to the Python text size and about 260K to the unstripped
# binary size.
#
# NOTE WHEN BUILDING FOR THE FIRST TIME:
# There is a circular dependency in the build process: you need to have
# a working Python interpreter before you can build a Python interpreter
# that incorporates the 'gl' module -- the source file 'glmodule.c' is
# not distributed (it's about 140K!) and a Python script is used to
# create it.  Thus, you first have to build python without the the GL
# and Panel options, then edit the Makefile to turn them (or at least GL)
# on and rebuild.  You may also have to set PYTHONPATH to point to
# the place where the module library is for the generation script to
# work.
#
# Uncomment the following block to use the GL option.

#GL_USE =      -DUSE_GL
#GL_LIBDEPS=
#GL_LIBS=      -lgl_s
#GL_SRC =      glmodule.c cgensupport.c
#GL_OBJ =      glmodule.o cgensupport.o


# Panel Option
# ============
#
# If you have source to the NASA Ames Panel Library, you can configure
# Python to incorporate the built-in module 'pnl', which is used byu
# the standard module 'panel' to provide an interface to most features
# of the Panel Library.  This option requires that you also turn on the
# GL option.  It adds about 100K to the Python text size and about 160K
# to the unstripped binary size.  This requires Panel Library version 9.7
# (for lower versions you may have to remove some functionality -- send
# me the patches if you bothered to do this).
#
# Uncomment and edit the following block to use the Panel option.
# - Edit the PANELDIR definition to point to the top-level directory
#   of the Panel distribution tree.

#PANELDIR=     /usr/people/guido/src/pl
#PANELLIBDIR=  $(PANELDIR)/library
#LIBPANEL=     $(PANELLIBDIR)/lib/libpanel.a
#PANEL_USE=    -DUSE_PANEL
#PANEL_INCL=   -I$(PANELLIBDIR)/include
#PANEL_LIBDEPS=        $(LIBPANEL)
#PANEL_LIBS=   $(LIBPANEL)
#PANEL_SRC=    panelmodule.c
#PANEL_OBJ=    panelmodule.o


# Audio Option
# ============
#
# This option lets you play with /dev/audio on the IRIS 4D/25.
# It incorporates the built-in module 'audio'.
# Warning: using the asynchronous I/O facilities of this module can
# create a second 'thread', which looks in the listings of 'ps' like a
# forked child.  However, it shares its address space with the parent.
#
# Uncomment the following block to use the Audio option.

#AUDIO_USE=    -DUSE_AUDIO
#AUDIO_SRC=    audiomodule.c asa.c
#AUDIO_OBJ=    audiomodule.o asa.o


# Major Definitions
# =================

STANDARD_OBJ=  acceler.o bltinmodule.o ceval.o classobject.o \
               compile.o dictobject.o errors.o fgetsintr.o \
               fileobject.o floatobject.o $(FMOD_OBJ) frameobject.o \
               funcobject.o $(GETCWD_OBJ) \
               graminit.o grammar1.o import.o \
               intobject.o intrcheck.o listnode.o listobject.o \
               mathmodule.o methodobject.o modsupport.o \
               moduleobject.o node.o object.o parser.o \
               parsetok.o posixmodule.o regexp.o regexpmodule.o \
               strdup.o $(STRERROR_OBJ) \
               stringobject.o $(STRTOL_OBJ) structmember.o \
               sysmodule.o timemodule.o tokenizer.o traceback.o \
               tupleobject.o typeobject.o

STANDARD_SRC=  acceler.c bltinmodule.c ceval.c classobject.c \
               compile.c dictobject.c errors.c fgetsintr.c \
               fileobject.c floatobject.c $(FMOD_SRC) frameobject.c \
               funcobject.c $(GETCWD_SRC) \
               graminit.c grammar1.c import.c \
               intobject.c intrcheck.c listnode.c listobject.c \
               mathmodule.c methodobject.c modsupport.c \
               moduleobject.c node.c object.c parser.c \
               parsetok.c posixmodule.c regexp.c regexpmodule.c \
               strdup.c $(STRERROR_SRC) \
               stringobject.c $(STRTOL_SRC) structmember.c \
               sysmodule.c timemodule.c tokenizer.c traceback.c \
               tupleobject.c typeobject.c

CONFIGDEFS=    $(STDW_USE) $(AM_USE) $(AUDIO_USE) $(GL_USE) $(PANEL_USE) \
               '-DPYTHONPATH="$(DEFPYTHONPATH)"'

CONFIGINCLS=   $(STDW_INCL)

LIBDEPS=       libpython.a $(STDW_LIBDEPS) $(AM_LIBDEPS) \
               $(GL_LIBDEPS) $(PANEL_LIBSDEP) $(RL_LIBDEPS)

# NB: the ordering of items in LIBS is significant!
LIBS=          libpython.a $(STDW_LIBS) $(AM_LIBS) \
               $(PANEL_LIBS) $(GL_LIBS) $(RL_LIBS) -lm

LIBOBJECTS=    $(STANDARD_OBJ) $(STDW_OBJ) $(AM_OBJ) $(AUDIO_OBJ) \
               $(GL_OBJ) $(PANEL_OBJ)

LIBSOURCES=    $(STANDARD_SRC) $(STDW_SRC) $(AM_SRC) $(AUDIO_SRC) \
               $(GL_SRC) $(PANEL_SRC)

OBJECTS=       pythonmain.o config.o

SOURCES=       $(LIBSOURCES) pythonmain.c config.c

GENOBJECTS=    acceler.o fgetsintr.o grammar1.o \
               intrcheck.o listnode.o node.o parser.o \
               parsetok.o strdup.o tokenizer.o bitset.o \
               firstsets.o grammar.o metagrammar.o pgen.o \
               pgenmain.o printgrammar.o

GENSOURCES=    acceler.c fgetsintr.c grammar1.c \
               intrcheck.c listnode.c node.c parser.c \
               parsetok.c strdup.c tokenizer.c bitset.c \
               firstsets.c grammar.c metagrammar.c pgen.c \
               pgenmain.c printgrammar.c


# Main Targets
# ============

python:                libpython.a $(OBJECTS) $(LIBDEPS) Makefile
	$(CC) $(CFLAGS) $(OBJECTS) $(LIBS) -o python

libpython.a:   $(LIBOBJECTS)
	-rm -f @lib
	ar cr @lib $(LIBOBJECTS)
	$(RANLIB) @lib
	mv @lib libpython.a

python_gen:    $(GENOBJECTS) $(RL_LIBDEPS)
	$(CC) $(CFLAGS) $(GENOBJECTS) $(RL_LIBS) -o python_gen


# Utility Targets
# ===============

# Don't take the output from lint too seriously.  I have not attempted
# to make Python lint-free.  But I use function prototypes.

LINTFLAGS=     -h

LINTCPPFLAGS=  $(CONFIGDEFS) $(CONFIGINCLS) $(SYSVDEF) \
               $(AM_INCL) $(PANEL_INCL)

LINT=          lint

lint::         $(SOURCES)
	$(LINT) $(LINTFLAGS) $(LINTCPPFLAGS) $(SOURCES)

lint::         $(GENSOURCES)
	$(LINT) $(LINTFLAGS) $(GENSOURCES)

# Generating dependencies is only necessary if you intend to hack Python.
# You may change $(MKDEP) to your favorite dependency generator (it should
# edit the Makefile in place).

MKDEP=         mkdep

depend::
	$(MKDEP) $(LINTCPPFLAGS) $(SOURCES) $(GENSOURCES)

# You may change $(CTAGS) to suit your taste...

CTAGS=         ctags -t -w

HEADERS=       *.h

tags:          $(SOURCES) $(GENSOURCES) $(HEADERS)
	$(CTAGS) $(SOURCES) $(GENSOURCES) $(HEADERS)

clean::
	-rm -f *.o core [,#@]*

clobber::      clean
	-rm -f python python_gen libpython.a tags


# Build Special Objects
# =====================

# You may change $(COMPILE) to reflect the default .c.o rule...

COMPILE=       $(CC) -c $(CFLAGS)

amoebamodule.o:        amoebamodule.c
	$(COMPILE) $(AM_INCL) $*.c

config.o:      config.c Makefile
	$(COMPILE) $(CONFIGDEFS) $(CONFIGINCLS) $*.c

fgetsintr.o:   fgetsintr.c
	$(COMPILE) $(SIGTYPEDEF) $*.c

intrcheck.o:   intrcheck.c
	$(COMPILE) $(SIGTYPEDEF) $*.c

panelmodule.o: panelmodule.c
	$(COMPILE) $(PANEL_INCL) $*.c

posixmodule.o: posixmodule.c
	$(COMPILE) $(SYSVDEF) $(NOSYMLINKDEF) $*.c

sc_interpr.o:  sc_interpr.c
	$(COMPILE) $(AM_INCL) $*.c

sc_error.o:    sc_error.c
	$(COMPILE) $(AM_INCL) $*.c

stdwinmodule.o:        stdwinmodule.c
	$(COMPILE) $(STDW_INCL) $*.c

timemodule.o:  timemodule.c
	$(COMPILE) $(SIGTYPEDEF) $(BSDTIMEDEF) $*.c

tokenizer.o:   tokenizer.c
	$(COMPILE) $(RL_USE) $*.c

.PRECIOUS:     python libpython.a glmodule.c graminit.c graminit.h


# Generated Sources
# =================
#
# Some source files are (or may be) generated.
# The rules for doing so are given here.

# Build "glmodule.c", the GL interface.
# See important note at "GL Option" above.
# You may have to set and export PYTHONPATH for this to work.
# Ignore the messages emitted by the cgen script as long as its exit
# status is zero.
# Also ignore the warnings emitted while compiling glmodule.c; it works.

glmodule.c:    cstubs cgen
	python cgen <cstubs >@glmodule.c
	mv @glmodule.c glmodule.c

# The dependencies for graminit.[ch] are not turned on in the
# distributed Makefile because the files themselves are distributed.
# Turn them on if you want to hack the grammar.

#graminit.c graminit.h:        Grammar python_gen
#	python_gen Grammar

