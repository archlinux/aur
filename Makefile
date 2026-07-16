CXX = g++
CXXFLAGS = -O3 -std=c++17 -Wall -Wextra
PKG_CONFIG_LIBS = gtk+-3.0 gdk-pixbuf-2.0


CXXFLAGS += $(shell pkg-config --cflags $(PKG_CONFIG_LIBS))
LIBS = $(shell pkg-config --libs $(PKG_CONFIG_LIBS))

TARGET = cliphist-cpp
SRC = main.cpp

PREFIX ?= /usr
DESTDIR ?=

all: $(TARGET)

$(TARGET): $(SRC)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(SRC) $(LIBS)

clean:
	rm -f $(TARGET)

install: all
	install -Dm755 $(TARGET) $(DESTDIR)$(PREFIX)/bin/$(TARGET)
	install -Dm644 cliphist-cpp.service $(DESTDIR)$(PREFIX)/lib/systemd/user/cliphist-cpp.service
	install -Dm644 cliphist-cpp.desktop $(DESTDIR)$(PREFIX)/share/applications/cliphist-cpp.desktop

.PHONY: all clean install
