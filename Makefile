.PHONY: all
all: .SRCINFO

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

.PHONY: clean
clean:
	rm -rf pkg src silicon-*.pkg.tar.xz v*.tar.gz
