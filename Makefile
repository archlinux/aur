clean:
	rm -rf pkg/
	rm -rf src/
	rm -rf *.tar.*

build:
	makepkg -si

install:
	makepkg -si