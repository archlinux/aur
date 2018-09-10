# Maintainer: Edward Pacman <micro<doT>fedora(aT)gmail<doT>com>

pkgname=libubox-lua-archwrt
_gitname=libubox
pkgver=r411.c83a84a
pkgrel=1
pkgdesc='A small utility library developed for OpenWrt containing a event loop, linked lists, blobmsg, stream buffer management, [...]'
url='http://git.openwrt.org/?p=project/libubox.git'
arch=('i686' 'x86_64' 'armv7h')
license=('ISC BSD-3c')
depends=('json-c' 'lua51')
makedepends=('git' 'cmake' 'gcc' 'make' 'patch' 'pkg-config')
conflicts=('libubox' 'libubox-git' 'libubox-lua-git')
provides=('libubox')
source=('git://git.openwrt.org/project/libubox.git' '001-lua-version.patch' '002-json-c-include.patch' '003-uloop.c.patch')
md5sums=('SKIP'
         '6753ffbf07d79b697e43aad9f3ec6ead'
         'd940bc9cc45645c62d30a72e877c10b8'
         'd0b08751db1bbedb80d4ee01920d4606')

pkgver() {
	cd "$srcdir/$_gitname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_gitname"

	patch -p1 -i "$srcdir/001-lua-version.patch"
	patch -p1 -i "$srcdir/002-json-c-include.patch"
	patch -p1 -i "$srcdir/003-uloop.c.patch"
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
}

# burp -c lib `ls libubox-lua-git*.src.tar.gz | sort | tail -n 1`
