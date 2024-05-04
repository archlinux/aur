.DEFAULT_GOAL := verify

check-pkgbuild:
	namcap PKGBUILD

check-package:
	namcap alacritty-theme-switcher-[0-9]*.tar.zst

build: check-pkgbuild
	makepkg -f --printsrcinfo > .SRCINFO
	makepkg -f

verify: build check-package
