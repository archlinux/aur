setup-repo:
	ssh://aur@aur.archlinux.org/doppler-cli-bin.git

make:
	makepkg

install:
	makepkg -si

update:
	./checkupdate.sh
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO
	git add ./PKGBUILD ./.SRCINFO
	git commit -m "Bump version"
	git push && git push aur master

check:
	./checkupdate.sh --dry-run

clean:
	rm -rf doppler-cli-bin-*.pkg.tar.zst doppler-cli-bin.*.tar.gz pkg/ src/
