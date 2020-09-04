.PHONY: all
all: clean update-checksums .SRCINFO build

.PHONY: clean
clean:
	rm -rf pkg/ src/ evans-bin-*

.PHONY: update-checksums
update-checksums:
	updpkgsums

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

.PHONY: build
build:
	makepkg
