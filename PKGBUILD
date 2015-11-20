# Maintainer: Luka Perkov <luka.perkov@sartura.hr>

pkgname=ubus-lua-git
_gitname=ubus
pkgver=r232.259450f
pkgrel=1
pkgdesc='An embedded bus system developed for OpenWrt. It is like dbus but simple and small.'
url='http://nbd.name/gitweb.cgi?p=luci2/ubus.git'
arch=('i686' 'x86_64' 'armv7h')
license=('LGPLv2.1')
depends=('libubox-lua-git' 'json-c' 'lua51')
makedepends=('git' 'cmake' 'gcc' 'make' 'patch' 'pkg-config')
conflicts=('ubus' 'ubus-git')
provides=('ubus')
source=('git://git.openwrt.org/project/ubus.git' '001-lua-version.patch' '002-ubusd-location.patch')
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/$_gitname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_gitname"

	patch -p1 -i "$srcdir/001-lua-version.patch"
	patch -p1 -i "$srcdir/002-ubusd-location.patch"
}

build() {
	cd "$srcdir/$_gitname"

	cmake CMakeLists.txt \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_EXAMPLES=OFF \
		-DBUILD_LUA=ON

	make
}

package() {
	cd "$srcdir/$_gitname"

	make DESTDIR="$pkgdir" install
}
