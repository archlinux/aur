# Maintainer: Luka Perkov <luka.perkov@sartura.hr>

pkgname=libubox-lua-git
_gitname=libubox
pkgver=r364.155bf39
pkgrel=1
pkgdesc='A small utility library developed for OpenWrt containing a event loop, linked lists, blobmsg, stream buffer management, [...]'
url='http://git.openwrt.org/?p=project/libubox.git'
arch=('i686' 'x86_64' 'armv7h')
license=('ISC BSD-3c')
depends=('json-c' 'lua51')
makedepends=('git' 'cmake' 'gcc' 'make' 'patch' 'pkg-config')
conflicts=('libubox' 'libubox-git')
provides=('libubox')
source=('git://git.openwrt.org/project/libubox.git' '001-lua-version.patch' '002-json-c-include.patch')
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/$_gitname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_gitname"

	patch -p1 -i "$srcdir/001-lua-version.patch"
	patch -p1 -i "$srcdir/002-json-c-include.patch"
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
