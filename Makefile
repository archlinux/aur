SHELL = /bin/sh
CXXFLAGS = -g -std=c++14 -Wall -Wextra -pedantic -static-libstdc++

all: sdn
%: %.cpp CMakeLists.txt
	$(CXX) $(CXXFLAGS) $< -o $@ `pkg-config --libs --cflags ncursesw` -lacl \
	`sed -ne 's/^project (\([^ )]*\).*/-DPROJECT_NAME="\1"/p' \
	-e 's/^set (version \([^ )]*\).*/-DPROJECT_VERSION="\1"/p' CMakeLists.txt`
clean:
	rm -f sdn

.PHONY: all clean
