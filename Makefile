.PHONY: all

all:
	@rm *.tar.* .SRCINFO
	@makepkg --printsrcinfo > .SRCINFO
	@sed -i 's/^sha512sums=.*$$/$(shell makepkg -g)/g' PKGBUILD
