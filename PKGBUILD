# Maintainer: Edward Pacman <micro<doT>fedora(aT)gmail<doT>com>

pkgname=uci-lua-archwrt
_gitname=uci
pkgver=r509.4c8b4d6
pkgrel=1
pkgdesc='C library for the Unified Configuration Interface (UCI)'
url='http://git.openwrt.org/?p=project/uci.git'
arch=('i686' 'x86_64' 'armv7h')
license=('LGPLv2.1 GPLv2')
depends=('libubox-lua-archwrt' 'lua51')
makedepends=('git' 'cmake' 'gcc' 'make' 'patch' 'pkg-config')
conflicts=('uci' 'uci-git' 'uci-lua-git')
provides=('uci')
source=('git://git.openwrt.org/project/uci.git'
		'001-lua-version.patch'
		'002-uci.c.patch'
		'003-uci.h.patch'
		'004-cli.c.patch')

md5sums=('SKIP'
         '34e0767e6d1df56d188b1e18d91ef46f'
         '3349bdf9478ce8659775c801e1c72d4b'
         'b07dbead8c9c88de0cd7de9c1bd6941e'
         'ed844618ae971ca78ebdc91a4c8f36a1')

pkgver() {
	cd "$srcdir/$_gitname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_gitname"

	patch -p1 -i "$srcdir/001-lua-version.patch"
	patch -p1 -i "$srcdir/002-uci.c.patch"
	patch -p1 -i "$srcdir/003-uci.h.patch"
	patch -p1 -i "$srcdir/004-cli.c.patch"
}

build() {
	cd "$srcdir/$_gitname"

	cmake CMakeLists.txt \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_LUA=ON

	make
}

package() {
	cd "$srcdir/$_gitname"

	make DESTDIR="$pkgdir" install
	mkdir -p "$pkgdir/opt/archwrt/etc/config"
}
