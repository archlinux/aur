
VERSION ?= $(shell stty -echo; read -p "Latest release: " pwd; stty echo; echo $$pwd)


update:
	./update.sh $(VERSION)

clean:
	rm -rf src pkg *.tar.xz *.gz *.pkg.tar
