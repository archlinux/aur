# ===============================================================================
#
#  Description: Common makefile for applications and libraries
#
#===============================================================================

#-------------  name of the executable binary  ---------------------------------
EXECUTABLE      ?=
LIB             ?= libco.so
STATICLIB       ?= libco.a

VERSION         ?= 0.20
VERSION_MAIN     = $(shell echo $(VERSION) | sed -r -n -e 's/([0-9]+)\..*/\1/p')
SONAME           = $(LIB).$(VERSION_MAIN)

#-------------  name of the target (can also be a library *.{a,so})  -----------
TARGET          ?= $(LIB) $(STATICLIB)

#-------------  list of all source files  --------------------------------------
HEADERS         ?= libco.h
SOURCES         ?= libco.c

#-------------  install directories  -------------------------------------------
PREFIX          ?= /usr
DESTDIR         ?=
LIBDIR          ?= $(PREFIX)/lib
INCLUDEDIR      ?= $(PREFIX)/include

INSTALL_LIBDIR     = $(DESTDIR)$(LIBDIR)
INSTALL_INCLUDEDIR = $(DESTDIR)$(INCLUDEDIR)

#-------------  directories of includes  ---------------------------------------
INC_DIR         ?= .

#-------------  directory of the dependency  -----------------------------------
DEPS_DIR        ?= ./.deps

# ------------  compiler flags  ------------------------------------------------
WARNFLAGS       ?= -Wall -Wextra -Wshadow
OPTFLAGS        ?= -O2 -fdata-sections -ffunction-sections
ARCHFLAGS       ?=
CFLAGS          ?= -std=c11
CPPFLAGS        := $(addprefix -D, $(DEFS) $(PREDEFS)) $(addprefix -I, $(INC_DIR))
LDFLAGS         ?= -Wl,-O1 -Wl,--gc-sections

# ------------  build-tools  ---------------------------------------------------
GP              ?=
CC              ?= $(GP)gcc
CXX             ?= $(GP)g++
LD              ?= $(GP)ld
OD              ?= $(GP)objdump
STRIP           ?= $(GP)strip
AR              ?= $(GP)ar
LN              ?= ln -sf
RM              ?= rm -f
RMDIR           ?= rmdir
MKDIR           ?= mkdir -p

ifeq ($(suffix $(LIB)), .so)
  CFLAGS        := -fpic $(CFLAGS)
  CXXFLAGS      := -fpic $(CXXFLAGS)
  LDFLAGS       := -shared $(LDFLAGS) -Wl,-soname=$(SONAME)
endif

ALL_CFLAGS      := $(WARNFLAGS) $(OPTFLAGS) $(ARCHFLAGS) $(CFLAGS) $(CPPFLAGS)
ALL_LDFLAGS     := $(LDFLAGS)

# ------------  generate the names of the source/object files  -----------------
ALL_SOURCES      = $(SOURCES)
BASENAMES        = $(basename $(ALL_SOURCES))
OBJECTS          = $(addprefix , $(addsuffix .o, $(BASENAMES)))
DEPS             = $(addprefix $(DEPS_DIR)/, $(addsuffix .d, $(BASENAMES)))

# ------------ basic compile rule ----------------------------------------------

.DEFAULT_GOAL := all

all: $(TARGET)

$(DEPS_DIR):
	@$(MKDIR) $(DEPS_DIR)

$(DEPS_DIR)/%.d: %.c Makefile | $(DEPS_DIR)
	@$(CC) -MM -E $(CPPFLAGS) $< > $@

-include $(DEPS)

%.o: %.c $(DEPS_DIR)/%.d
	$(CC) $(ALL_CFLAGS) -g -c $< -o $@

%.so: $(OBJECTS)
	$(CXX) $(WARNFLAGS) $(OBJECTS) -shared $(ALL_LDFLAGS) -o $@

%.a: $(OBJECTS)
	$(AR) rcs $@ $(OBJECTS)

clean:
	-@$(RM) *.o *.so *.a $(addprefix $(DEPS_DIR)/, *.d)
	-@$(RMDIR) $(DEPS_DIR) 2>/dev/null; true

install: $(TARGET)
	install -m 644 -D -t $(INSTALL_INCLUDEDIR) $(HEADERS)
	install -m 644 -D -T $(STATICLIB) $(INSTALL_LIBDIR)/$(notdir $(STATICLIB))
	install -m 755 -D -T $(LIB) $(INSTALL_LIBDIR)/$(notdir $(LIB)).$(VERSION)
	ldconfig -n $(INSTALL_LIBDIR)
	ln -fs $(notdir $(LIB)).$(VERSION) $(INSTALL_LIBDIR)/$(notdir $(LIB))

.SECONDARY: $(DEPS) $(OBJECTS)

.PHONY: all clean install

