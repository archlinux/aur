# PKGBUILD prototype location: /usr/share/pacman/PKGBUILD.proto
# .install prototype location: /usr/share/pacman/proto.install
# Example: https://github.com/archlinuxarm/PKGBUILDs/blob/master/aur/libcrossguid-git/PKGBUILD
# Git pkgver() examples: https://wiki.archlinux.org/index.php/VCS_package_guidelines#The_pkgver.28.29_function

# Uses taner1's newer fork (allows setting fan speeds from 40% to 100%)

# Maintainer: Tech Guy Software <techguy100official at gmail dot com>
pkgname=clevo-indicator-git
pkgver=r19.c59790a
pkgrel=6
#epoch=
pkgdesc="Command-line and system tray fan control utility for Clevo laptops"
arch=('x86_64')
url="https://github.com/taner1/clevo-indicator"
license=('custom:Unlicense')
#groups=()
depends=()
optdepends=()
makedepends=('git' 'gcc' 'libappindicator-gtk3')
provides=('clevo-indicator')
#conflicts=()
#replaces=()
#backup=()
#options=()
changelog=README.md
source=("${pkgname%}::git+https://github.com/taner1/clevo-indicator.git")
md5sums=('SKIP')
#noextract=()
#validpgpkeys=()

pkgver() {
	# Return most recent git revisions and shortened MD5 from package directory
	# as a formatted string
	cd "$srcdir"/"$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	# make from source and install built binary to fakeroot $pkgdir/usr/bin
	cd "$srcdir"/"$pkgname"

	# We are not using the package's makefile for install, it uses sudo. Instead just compile using gcc,
	# copy the clevo-indicator binary in $srcdir/$pkgname/bin/clevo-indicator and copy to $pkgdir/usr/bin/clevo-indicator using install command
	mkdir -p bin

	# Fixes from: https://ubuntuforums.org/showthread.php?t=2053347 and https://stackoverflow.com/questions/10721623/echo-style-appending-but-to-the-beginning-of-a-file
	# This fixes the issue with the tray indicator on GTK3 and KDE! (since libappindicator works with KDE)
	# look into clevo-indicator.c file for correct gcc testing command
	mkdir -p "$pkgdir/usr/bin"
	gcc src/clevo-indicator.c -o bin/clevo-indicator `pkg-config --cflags --libs appindicator3-0.1` -lm
	install -m 555 "bin/clevo-indicator" "$pkgdir/usr/bin/clevo-indicator"
	
	# copy Unlicense license to fakeroot /usr/share/licenses/clevo-indicator-git
	mkdir -p "$pkgdir/usr/share/licenses/clevo-indicator-git"
	cp LICENSE "$pkgdir/usr/share/licenses/clevo-indicator-git"

	# stickybit flags (sudo if user runs the command) - required for the tray icon to work - root will be the owner after install, so the stickybit will work
	# https://unix.stackexchange.com/questions/79395/how-does-the-sticky-bit-work
	chmod u+s $pkgdir/usr/bin/clevo-indicator
	
	# Post-install instructions
	echo "--> Packaging successful! After install, run the fan control utility using the command \"clevo-indicator\" and a tray icon will appear."
}
