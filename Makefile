make:
	makepkg

install:
	makepkg -si

update:
	./checkupdate.sh
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO

check:
	./checkupdate.sh --dry-run

clean:
	rm -rf doppler-cli-bin-*.pkg.tar.zst doppler-cli-bin.*.tar.gz pkg/ src/
