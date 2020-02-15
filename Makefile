.PHONY: PKGBUILD clean package

all: PKGBUILD .SRCINFO

PKGBUILD:
	makepkg -docC

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

package: .SRCINFO
	makepkg -f

clean:
	rm -rf aws-vault-git pkg src completion *.tar.xz