.PHONY: clean
clean:
	rm -rf pkg src *.zst

.PHONY: srcinfo
srcinfo:
	makepkg --printsrcinfo > .SRCINFO

all:
	makepkg -si
