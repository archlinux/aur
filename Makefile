setup-repo:
	ssh://aur@aur.archlinux.org/doppler-cli-bin.git

make:
	makepkg

install:
	makepkg -si

update:
	./update.sh

check:
	./checkupdate.sh --dry-run

clean:
	rm -rf doppler-cli-bin-*.pkg.tar.zst doppler-cli-bin.*.tar.gz pkg/ src/
