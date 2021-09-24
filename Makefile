.PHONY: setup-repo build install update clean purge

setup-repo:
	git remote add aur ssh://aur@aur.archlinux.org/dmenu-grid.git

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
	rm -rf pkg src dmenu-grid *.diff *.zst
