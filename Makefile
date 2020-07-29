.PHONY: prepare clean

prepare:
	makepkg --printsrcinfo > .SRCINFO

clean:
	git clean -fX
