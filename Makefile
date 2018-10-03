INCLUDES = -I. -I../d_cpp
CXXFLAGS ?= -O2 -W -Wall -ansi -pedantic
CXXFLAGS += -ansi
CFLAGS ?= -O2
prefix ?= /usr/local
VDIR = tinyxml

includedir ?= $(prefix)/include
libdir ?= $(prefix)/lib

MAJOR=0d2
MINOR=0

VPATH=.:tinyxml
OBJS = bulletmlparser-tinyxml.o bulletmlparser.o bulletmltree.o calc.o \
	formula-variables.o bulletmlrunner.o bulletmlrunnerimpl.o bulletml_d.o
TINYXML = tinyxml.o tinyxmlerror.o tinyxmlparser.o

all:  bulletml.d libbulletml.a libbulletml.so.$(MAJOR).$(MINOR)

libbulletml.a: $(OBJS) $(TINYXML)
	$(AR) cru $@ $^

libbulletml.so.$(MAJOR).$(MINOR): $(OBJS) $(TINYXML)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -shared -fPIC -fpic \
		-Wl,-soname,libbulletml.so.$(MAJOR) \
		-o $@ $^

bulletml.d: bulletml_d.cpp
	perl ../d_cpp/create_d_import.pl bulletml_d.cpp bulletml.d

clean:
	rm -f calc.cpp libbulletml.a libbulletml.so.$(MAJOR).$(MINOR) *.o tinyxml/*.o

calc.cpp: calc.yy
		bison -y calc.yy -o calc.cpp

$(OBJS) $(TINYXML): %.o: %.cpp
	$(CXX) -c $(CXXFLAGS) -fPIC -fpic $(INCLUDES) $<

doxy:
	doxygen

install: all
	install -D -m 644 bulletml.d $(DESTDIR)/$(includedir)/d/bulletml.d
	install -D -m 644 tinyxml/tinyxml.h \
		$(DESTDIR)/$(includedir)/bulletml/tinyxml/tinyxml.h
	install -m 644 *.h $(DESTDIR)/$(includedir)/bulletml
	install -d $(DESTDIR)/$(libdir)
	install -m 644 libbulletml.a $(DESTDIR)/$(libdir)
	install -m 644 libbulletml.so.$(MAJOR).$(MINOR) $(DESTDIR)/$(libdir)
	ln -f -r -s \
		$(DESTDIR)/$(libdir)/libbulletml.so.$(MAJOR).$(MINOR) \
		$(DESTDIR)/$(libdir)/libbulletml.so.$(MAJOR)
	ln -f -r -s \
		$(DESTDIR)/$(libdir)/libbulletml.so.$(MAJOR).$(MINOR) \
		$(DESTDIR)/$(libdir)/libbulletml.so

.PHONY: all clean doxy install
