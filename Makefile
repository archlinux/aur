.PHONY: PKGBUILD clean

all: PKGBUILD .SRCINFO

PKGBUILD:
	makepkg -doc

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf gds-cli-git pkg src