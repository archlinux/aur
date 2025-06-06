# libexecinfo - BSD backtrace library
# Modern Makefile for 2025

# Build configuration
CC ?= cc
AR ?= ar
PYTHON ?= python3
STRIP ?= strip
INSTALL ?= install

# Version information
VERSION_MAJOR = 1
VERSION_MINOR = 1
VERSION_PATCH = 0
VERSION = $(VERSION_MAJOR).$(VERSION_MINOR).$(VERSION_PATCH)
SONAME = libexecinfo.so.$(VERSION_MAJOR)

# Installation paths
DESTDIR ?=
PREFIX ?= /usr/local
LIBDIR ?= $(PREFIX)/lib
INCLUDEDIR ?= $(PREFIX)/include
PKGCONFIGDIR ?= $(LIBDIR)/pkgconfig

# Compiler and linker flags
CPPFLAGS ?=
CFLAGS ?= -O2 -g
LDFLAGS ?=

# Security and modern compiler flags
SECURITY_CFLAGS = -fstack-protector-strong -D_FORTIFY_SOURCE=2 \
                  -fPIC -Wall -Wextra -Wformat=2 -Wformat-security \
                  -Wnull-dereference -Wstack-protector -Wtrampolines

# Standard compliance
STD_CFLAGS = -std=gnu11

# Architecture-specific optimizations
ARCH_CFLAGS = -march=native -mtune=native

# Debug vs Release
DEBUG ?= 0
ifeq ($(DEBUG), 1)
    BUILD_CFLAGS = -O0 -g3 -DDEBUG -fsanitize=address -fsanitize=undefined
    BUILD_LDFLAGS = -fsanitize=address -fsanitize=undefined
else
    BUILD_CFLAGS = -O2 -g -DNDEBUG -flto
    BUILD_LDFLAGS = -flto -Wl,-O1 -Wl,--as-needed -Wl,-z,relro -Wl,-z,now
endif

# Final flags
EXECINFO_CFLAGS = $(CPPFLAGS) $(CFLAGS) $(STD_CFLAGS) $(SECURITY_CFLAGS) \
                  $(BUILD_CFLAGS) -c
EXECINFO_LDFLAGS = $(LDFLAGS) $(BUILD_LDFLAGS)

# Source files
SOURCES = execinfo.c stacktraverse.c
OBJECTS = $(SOURCES:.c=.o)
SHARED_OBJECTS = $(SOURCES:.c=.So)

# Generated files
GENERATED_FILES = stacktraverse.c

# Targets
STATIC_LIB = libexecinfo.a
SHARED_LIB = libexecinfo.so.$(VERSION)
TEST_BINARY = test

.PHONY: all static dynamic test clean install install-static install-dynamic \
        install-headers install-pkgconfig uninstall help generate

# Default target
all: static dynamic

# Generate source files
generate: $(GENERATED_FILES)

stacktraverse.c: gen.py
	$(PYTHON) gen.py --max-depth 128 --output $@

# Static library
static: $(STATIC_LIB)

$(STATIC_LIB): $(OBJECTS)
	$(AR) rcs $@ $^

# Dynamic library
dynamic: $(SHARED_LIB)

$(SHARED_LIB): $(SHARED_OBJECTS)
	$(CC) -shared -Wl,-soname,$(SONAME) $(EXECINFO_LDFLAGS) -o $@ $^
	ln -sf $@ $(SONAME)
	ln -sf $@ libexecinfo.so

# Object files
%.o: %.c
	$(CC) $(EXECINFO_CFLAGS) -o $@ $<

%.So: %.c
	$(CC) $(EXECINFO_CFLAGS) -fPIC -DPIC -o $@ $<

# Test program
test: $(TEST_BINARY)

$(TEST_BINARY): test.c $(STATIC_LIB)
	$(CC) $(CFLAGS) $(STD_CFLAGS) -o $@ $< -L. -lexecinfo -ldl

# Generate pkg-config file
libexecinfo.pc:
	@echo "prefix=$(PREFIX)" > $@
	@echo "exec_prefix=\$${prefix}" >> $@
	@echo "libdir=$(LIBDIR)" >> $@
	@echo "includedir=$(INCLUDEDIR)" >> $@
	@echo "" >> $@
	@echo "Name: libexecinfo" >> $@
	@echo "Description: BSD backtrace library" >> $@
	@echo "Version: $(VERSION)" >> $@
	@echo "Libs: -L\$${libdir} -lexecinfo" >> $@
	@echo "Cflags: -I\$${includedir}" >> $@

# Installation targets
install: install-dynamic install-static install-headers install-pkgconfig

install-static: $(STATIC_LIB)
	$(INSTALL) -D -m644 $< $(DESTDIR)$(LIBDIR)/$<

install-dynamic: $(SHARED_LIB)
	$(INSTALL) -D -m755 $< $(DESTDIR)$(LIBDIR)/$<
	ln -sf $< $(DESTDIR)$(LIBDIR)/$(SONAME)
	ln -sf $< $(DESTDIR)$(LIBDIR)/libexecinfo.so
	ldconfig -n $(DESTDIR)$(LIBDIR) 2>/dev/null || true

install-headers:
	$(INSTALL) -D -m644 execinfo.h $(DESTDIR)$(INCLUDEDIR)/execinfo.h
	$(INSTALL) -D -m644 stacktraverse.h $(DESTDIR)$(INCLUDEDIR)/stacktraverse.h

install-pkgconfig: libexecinfo.pc
	$(INSTALL) -D -m644 $< $(DESTDIR)$(PKGCONFIGDIR)/$<

# Uninstall
uninstall:
	rm -f $(DESTDIR)$(LIBDIR)/libexecinfo.*
	rm -f $(DESTDIR)$(INCLUDEDIR)/execinfo.h
	rm -f $(DESTDIR)$(INCLUDEDIR)/stacktraverse.h
	rm -f $(DESTDIR)$(PKGCONFIGDIR)/libexecinfo.pc

# Clean
clean:
	rm -f *.o *.So *.a *.so *.so.* $(TEST_BINARY) libexecinfo.pc
	rm -f $(GENERATED_FILES)

# Help target
help:
	@echo "libexecinfo build system"
	@echo ""
	@echo "Targets:"
	@echo "  all              - Build static and dynamic libraries (default)"
	@echo "  static           - Build static library only"
	@echo "  dynamic          - Build dynamic library only"
	@echo "  test             - Build test program"
	@echo "  generate         - Generate source files"
	@echo "  install          - Install everything"
	@echo "  install-static   - Install static library"
	@echo "  install-dynamic  - Install dynamic library"
	@echo "  install-headers  - Install header files"
	@echo "  clean            - Remove build artifacts"
	@echo "  help             - Show this help"
	@echo ""
	@echo "Variables:"
	@echo "  DEBUG=1          - Enable debug build with sanitizers"
	@echo "  PREFIX=/path     - Installation prefix (default: /usr/local)"
	@echo "  CC=compiler      - C compiler to use"
	@echo "  PYTHON=python    - Python interpreter for code generation"
