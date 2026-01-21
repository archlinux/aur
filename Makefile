.PHONY: package
.PHONY: srcinfo

package:
	makepkg -f

srcinfo: package
	makepkg --printsrcinfo > .SRCINFO
