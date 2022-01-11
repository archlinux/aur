.PHONY: all

all: clean rebuild srcinfo

rebuild:
	makepkg -s

srcinfo:
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf pkg src x11-emoji-picker/ x11-emoji-picker*.tar.*
