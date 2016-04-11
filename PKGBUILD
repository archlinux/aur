# Maintainer: Luka Perkov <luka.perkov@sartura.hr>

pkgname=ubus-lua-git
_gitname=ubus
pkgver=r251.fcf5d8a
pkgrel=1
pkgdesc='An embedded bus system developed for OpenWrt. It is like dbus but simple and small.'
url='http://git.openwrt.org/?p=project/ubus.git;a=summary'
arch=('i686' 'x86_64' 'armv7h')
license=('LGPLv2.1')
depends=('libubox-lua-git' 'json-c' 'lua51')
makedepends=('git' 'cmake' 'gcc' 'make' 'patch' 'pkg-config')
conflicts=('ubus' 'ubus-git')
provides=('ubus')
source=('git://git.openwrt.org/project/ubus.git' '001-lua-version.patch' '002-ubusd-location.patch')
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd "$_gitname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_gitname"

	patch -p1 -i "$srcdir/001-lua-version.patch"
	patch -p1 -i "$srcdir/002-ubusd-location.patch"
}

build() {
	cd "$_gitname"

	cmake CMakeLists.txt \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_EXAMPLES=OFF \
		-DBUILD_LUA=ON

	make
}

package() {
	cd "$_gitname"

	make DESTDIR="$pkgdir" install
}
