build:
	makepkg -f

install:
	yes | makepkg -i

clean:
	rm -rf pkg src
	rm -rf yubihsm2-sdk*

update-srcinfo:
	makepkg --printsrcinfo > .SRCINFO

generate-checksums:
	makepkg -g -f -p PKGBUILD
