build: clean
	makepkg -i

clean:
	rm *.pkg.tar.xz src/ pkg/ allegro_blasteroids/ -rf

clean-all: clean
	rm *.zip
