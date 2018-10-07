all: PKGBUILD .SRCINFO

PKGBUILD:
	updpkgsums

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

check: PKGBUILD
	makepkg -fc

clean:
	$(RM) *.pkg.*
	$(RM) -rf camisole

.PHONY: all check clean PKGBUILD
