.PHONY: srcinfo build clean

srcinfo:
	makepkg --printsrcinfo > .SRCINFO

build:
	makepkg -f

clean:
	rm -rf src pkg nah *.pkg.tar.* *.log
