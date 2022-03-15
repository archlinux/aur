.PHONY: PKGBUILD clean package

all: PKGBUILD .SRCINFO

PKGBUILD:
	makepkg -docC

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

package: .SRCINFO
	makepkg -f

clean:
	rm -rf *.AppImage src *.tar.zst LICENSE
