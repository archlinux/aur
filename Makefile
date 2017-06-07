# This is actually for hacking around with the script
# as makepkg -si will leave a mess after exiting.

build:
	@makepkg -si

clean:
	@rm -rf pkg/ src/ notify-when-done-i3-git/ *pkg.tar.xz

# vim: set noet ts=4:
