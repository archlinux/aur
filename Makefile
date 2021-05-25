PKG := cue-bin

build:
	makepkg -f

install:
	makepkg -i --noconfirm

clean:
	rm -rf pkg src
	rm -rf $(PKG)*

update-srcinfo:
	makepkg --printsrcinfo > .SRCINFO

generate-checksums:
	makepkg -g -f -p PKGBUILD
