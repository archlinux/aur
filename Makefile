.PHONY: build

default: build

clean:
	rm -rf dexbot pkg src dexbot-*.tar

build: clean
	makepkg --printsrcinfo > .SRCINFO
	makepkg -f
