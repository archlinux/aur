# Maintainer: alive4ever <alive4ever at live.com>
pkgname=maynard-git
pkgver=r121.a191e5c
pkgrel=1
pkgdesc="Lightweight desktop environment based on Weston compositor for use with Wayland"
arch=('x86_64' 'i686')
url="https://github.com/raspberrypi/maynard"
license=('custom:MIT' 'GPL')
provides=("maynard")
depends=("weston")
makedepends=('git')
install=maynard.install
source=("${pkgname%-VCS}::git+https://github.com/raspberrypi/maynard.git")
sha256sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"

# The examples below are not absolute and need to be adapted to each repo. The
# primary goal is to generate version numbers that will increase according to
# pacman's version comparisons with later commits to the repo. The format
# VERSION='VER_NUM.rREV_NUM.HASH', or a relevant subset in case VER_NUM or HASH
# are not available, is recommended.

# Git, tags available
	#printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
	cd "$srcdir/${pkgname%-VCS}"
	./autogen.sh
	./configure --prefix=/usr --libexecdir=/usr/lib/maynard --sysconfdir=/etc --bindir=/usr/bin --libdir=/usr/lib
	make
}

check() {
	cd "$srcdir/${pkgname%-VCS}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-VCS}"
	make DESTDIR="$pkgdir/" install
}
