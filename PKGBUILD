# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-wayland-git
pkgver=r16.79422319
pkgrel=1
pkgdesc="Wayland client and server libraries for Qt applications"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('LGPL3')
depends=('wayland-protocols' 'qt5-wayland')
makedepends=('git' 'liri-cmake-shared-git')
options=(debug !strip)
conflicts=('liri-wayland')
replaces=('liri-wayland')
provides=('liri-wayland')
groups=('liri-git')

_gitroot="git://github.com/lirios/wayland.git"
_gitbranch=develop
_gitname=wayland
source=(${_gitname}::${_gitroot}#branch=${_gitbranch})
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_gitname}
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake ../${_gitname} \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_TESTING:BOOL=OFF \
		-DINSTALL_SYSCONFDIR=/etc \
		-DINSTALL_LIBDIR=/usr/lib \
		-DINSTALL_LIBEXECDIR=/usr/lib \
		-DINSTALL_QMLDIR=/usr/lib/qt/qml \
		-DINSTALL_PLUGINSDIR=/usr/lib/qt/plugins
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
