.PHONY: all
all: .SRCINFO

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

.PHONY: clean
clean:
	rm -rf pkg src
	rm -f rabtap-bin*.pkg.tar.xz
	rm -f rabtap-v*.zip
