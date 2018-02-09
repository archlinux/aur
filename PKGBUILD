# Maintainer: Luka Perkov <luka.perkov@sartura.hr>

pkgname=uci-lua-git
_gitname=uci
pkgver=r505.5beb95d
pkgrel=1
pkgdesc='C library for the Unified Configuration Interface (UCI)'
url='http://git.openwrt.org/?p=project/uci.git'
arch=('i686' 'x86_64' 'armv7h')
license=('LGPLv2.1 GPLv2')
depends=('libubox-lua-git' 'lua51')
makedepends=('git' 'cmake' 'gcc' 'make' 'patch' 'pkg-config')
conflicts=('uci' 'uci-git')
provides=('uci')
source=('git://git.openwrt.org/project/uci.git' '001-lua-version.patch')
md5sums=('SKIP' '34e0767e6d1df56d188b1e18d91ef46f')

pkgver() {
	cd "$srcdir/$_gitname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_gitname"

	patch -p1 -i "$srcdir/001-lua-version.patch"
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
