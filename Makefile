.PHONY: setup-repo build install update clean purge

setup-repo:
	git remote set-url aur ssh://aur@aur.archlinux.org/dmenu-gregdan3.git

build:
	makepkg

install:
	makepkg -si

update:
	# TODO: check for update?
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO
	git add ./PKGBUILD ./.SRCINFO
	# User: Go commit!

clean:
	rm -rf pkg src st *.diff

purge:
	rm -rf pkg src st *.diff *.zst
