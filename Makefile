.PHONY: setup-repo make install update check clean test all

PKGNAME=ttf-unifont-csur
ARTIFACTS=pkg/ src/ *.tar.*

setup-repo:
	git remote add aur ssh://aur@aur.archlinux.org/${PKGNAME}.git

make:
	makepkg

install:
	makepkg -si

update:
	./update.sh

check:
	./update.sh --dry-run

clean:
	rm -rf ${ARTIFACTS}
