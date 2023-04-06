.PHONY: clean
clean:
	rm -rf pkg src *.zst *.deb

.PHONY: srcinfo
srcinfo:
	makepkg --printsrcinfo > .SRCINFO

all:
	makepkg -si
