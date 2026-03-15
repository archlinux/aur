# SPDX-FileCopyrightText: "Arch Linux contributors"
# SPDX-License-Identifier: 0BSD

build:
	makepkg -f
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf pkg src tuvpn-gui *.pkg.tar.*
