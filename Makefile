.PHONY: prepare

prepare:
	gpg --detach-sign --yes grub-mkconfig
	gpg --detach-sign --yes zz_snap-pac-grub-post.hook
	gpg --detach-sign --yes PKGBUILD
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO
