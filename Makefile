build:
	makepkg -f

install:
	yes | makepkg -i

clean:
	rm -rf pkg src
	rm -rf git-subrepo*

update-srcinfo:
	makepkg --printsrcinfo > .SRCINFO

generate-checksums:
	makepkg -g -f -p PKGBUILD
