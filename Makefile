SHELL:=/bin/bash

.ONESHELL:


update-srcinfo: FORCE
	makepkg --printsrcinfo > .SRCINFO

install-force: FORCE
	makepkg -f

verify: FORCE
	makepkg -C -f --noconfirm


.PHONY: FORCE
FORCE:
