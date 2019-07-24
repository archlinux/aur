.PHONY: all

all:
	@rm -f *.tar.* .SRCINFO
	@makepkg --printsrcinfo > .SRCINFO
	@sed -i 's/^sha512sums=.*$$/$(shell makepkg -g)/g' PKGBUILD
