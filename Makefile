.PHONY: all

all:
	@makepkg --printsrcinfo > .SRCINFO
	@sed -i 's/^sha512sums=.*$$/$(shell makepkg -g)/' PKGBUILD
