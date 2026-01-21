.PHONY: package
.PHONY: srcinfo

package:
	makepkg -f

srcinfo: package
	makepkg --printsrcinfo > .SRCINFO

browse:
	xdg-open https://aur.archlinux.org/packages/gdlauncher-carbon-bin
