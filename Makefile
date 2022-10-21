.PHONY: all
PKGNAME := wg-systray

all: clean rebuild srcinfo

rebuild:
	makepkg -s

srcinfo:
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf pkg src $(PKGNAME)/ $(PKGNAME)*.tar.*
