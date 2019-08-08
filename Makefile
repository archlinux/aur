.PHONY: all

all:
	@rm -f *.tar.* .SRCINFO
	@sed -i 's/^sha512sums=.*$$/$(shell makepkg -g)/g' PKGBUILD
	@makepkg --printsrcinfo > .SRCINFO
