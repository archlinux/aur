MAKEFLAGS += -Rr
OUTPUT = $(shell bash -c 'source PKGBUILD && echo mitsuba3-git-$pkgver-$pkgrel-x86_64.pkg.tar.zst')

PKGREL = $(shell bash -c 'source PKGBUILD && echo $pkgver')

.PHONY: check help clean distclean
.DEFAULT: help

help:: ## show this help text
	@grep -Eh '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-13s - %s\n", $$1, $$2}'

clean:: ## remove files associated with this build
	rm -rf pkg src mitsuba3-git-*.pkg.tar.zst

distclean:: clean ## remove all downloaded and built files
	rm -rf asmjit cmake-defaults drjit drjit-core embree fast_float glfw IntelSEAPI mitsuba3 mitsuba-data mitsuba-tutorials openexr nanogui nanothread nanovg nanovg_metal robin-map tinyformat

.SRCINFO: PKGBUILD ## update the .SRCINFO file
	makepkg --printsrcinfo > $@

build: ${OUTPUT} ## build package

${OUTPUT}: PKGBUILD
	makepkg -sf
