updatesums:
	@makepkg -g

build:
	@makepkg -f
	@makepkg --printsrcinfo > .SRCINFO

install:
	@sudo pacman -U wepush-*-x86_64.pkg.tar.zst
