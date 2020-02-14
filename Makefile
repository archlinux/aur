.PHONY: PKGBUILD clean package

all: PKGBUILD .SRCINFO

PKGBUILD:
	makepkg -docC

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

package: .SRCINFO
	makepkg

clean:
	rm -rf govuk-guix-git pkg src completion *.tar.xz