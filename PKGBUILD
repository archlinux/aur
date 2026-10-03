# Maintainer: Cody Schafer <dev@codyps.com>

pkgrel=3
_bpn=diod
pkgname=$_bpn-git
pkgdesc="A multi-threaded, user space file server that speeks 9P2000.L"
license=('GPL2')
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/chaos/diod.git"

source=("git+https://github.com/chaos/diod.git")
md5sums=('SKIP')

conflicts=("$_bpn")
provides=("$_bpn")

makedepends=('git' 'autoconf-archive')
depends=('lua54' 'libcap' 'bash' 'munge' 'ncurses')

# from https://wiki.archlinux.org/index.php/VCS_package_guidelines
pkgver=1.0.24.r89.g3da6e52
pkgver() {
	cd "$srcdir/$_bpn"
	( set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "$srcdir/$_bpn"
	./autogen.sh
}

build () {
	cd "$srcdir/$_bpn"
	LUA=lua5.4 LUA_INCLUDE="$(pkg-config --cflags lua54)" \
	  LUA_LIB="$(pkg-config --libs lua54)" ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin
	# Upstream developer warnings must not fail distribution builds.
	make AM_CFLAGS=-Wall
}

package () {
	cd "$srcdir/$_bpn"
	make "DESTDIR=$pkgdir" install
}
