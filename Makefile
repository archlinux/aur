.PHONY: all clean

all: azpainterb-*.pkg.tar

azpainterb-*.pkg.tar: .SRCINFO PKGBUILD
	makepkg

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm azpainterb-*.tar.xz azpainterb-*.pkg.tar
