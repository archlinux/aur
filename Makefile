.PHONY: all clean updpkgsums

all: azpainterb-*.pkg.tar.zst

azpainterb-*.pkg.tar.zst: .SRCINFO PKGBUILD
	makepkg -f

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

updpkgsums:
	updpkgsums

clean:
	rm azpainterb-*.tar.xz azpainterb-*.pkg.tar
