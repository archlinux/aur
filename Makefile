PKGNAME=nodejs-markmap-cli

setup-repo:
	git remote add aur ssh://aur@aur.archlinux.org/$(PKGNAME).git

make:
	makepkg

install:
	makepkg -si

update:
	./update.sh

check:
	./update.sh --dry-run

clean:
	rm -rf $(PKGNAME)-*.pkg.tar.zst $(PKGNAME).*.tar.gz pkg/ src/
