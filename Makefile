.PHONY: all

all:
	@rm -f *.tar.* .SRCINFO gitlab-cli*
	@sed -i 's/^sha512sums=.*$$/$(shell makepkg -g)/g' PKGBUILD
	@makepkg --printsrcinfo > .SRCINFO
