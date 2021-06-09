make:
	makepkg

install:
	makepkg -si

update:
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf doppler-cli-bin.*.pkg.tar.zst doppler-cli-bin.*.tar.gz pkg/ src/
