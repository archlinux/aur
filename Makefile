include .SRCINFO

ARTIFACTS := $(pkgname)-$(pkgver)-$(pkgrel)-$(arch).pkg.tar.zst $(pkgname)-debug-$(pkgver)-$(pkgrel)-$(arch).pkg.tar.zst

.PHONY: build all clean
all: $(ARTIFACTS)
build:
	docker build -t $(pkgbase) .
%.pkg.tar.zst: build
	docker run $(pkgbase) cat $(@F) >$@
.SRCINFO: PKGBUILD
	makepkg --printsrcinfo >$@
clean: F = $(wildcard $(ARTIFACTS))
clean:
	$(if $(strip $F),$(RM) -- $F,)
