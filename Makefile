.PHONY: pre post clean

pre:
	makepkg -g

post:
	makepkg --verifysource -f
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf /tmp/makepkg/tla2json
	git clean -fX
