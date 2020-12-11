.PHONY: prepare
prepare:
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO

.PHONY: clean
clean:
	rm -f *.tar.*
	rm -rf src pkg
