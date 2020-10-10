.PHONY: all
all: .SRCINFO

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

.PHONY: clean
clean:
	rm -rf pkg src
	rm -f neuron-*-linux.tar.gz
	rm -f neuron-zettelkasten-bin-*.tar.xz
