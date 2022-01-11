.PHONY: all

all: clean rebuild changelog srcinfo

rebuild:
	makepkg -s

changelog:
	curl -L https://raw.githubusercontent.com/zneix/haste-client/master/CHANGELOG.md > haste-client-git.changelog

srcinfo:
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf pkg src haste-client/ haste-client*.tar.*
