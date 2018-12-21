build: clean
	makepkg -i

clean:
	rm *.pkg.tar.xz src/ pkg/ -rf

clean-all: clean
	rm *.zip
