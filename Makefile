MAKEFLAGS += --no-builtin-rules
OUTPUT = $(shell bash -c 'source PKGBUILD && echo mitsuba2-git-$pkgver-$pkgrel-x86_64.pkg.tar.zst')

PKGREL = $(shell bash -c 'source PKGBUILD && echo $pkgver')

.PHONY: check help clean distclean
.DEFAULT: help

check:: .SRCINFO

help:: ## show this help text
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-13s - %s\n", $$1, $$2}'

clean:: ## remove files associated with this build
	rm -rf pkg src

distclean:: clean ## remove all downloaded and built files
	rm -f mitsuba2-git-*-x86_64.pkg.tar.zst
	rm -rf asmjit enoki mitsuba-data mitsuba2 openexr tbb tinyformat

.SRCINFO: PKGBUILD ## update the .SRCINFO file
	makepkg --printsrcinfo > $@

build: ${OUTPUT} ## build package

${OUTPUT}: PKGBUILD
	makepkg -sf
