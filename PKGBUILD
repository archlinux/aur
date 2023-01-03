# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=aurora-client-git
pkgver=r105.a462da0
pkgrel=1
pkgdesc="Wayland protocol implementation for Qt-based clients"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('GPL3')
depends=('qt5-base' 'qt5-wayland' 'qt5-declarative')
makedepends=('git' 'liri-cmake-shared-git' 'aurora-scanner-git')
conflicts=('aurora-client')
replaces=('aurora-client')
provides=('aurora-client')
groups=('liri-git')

_gitroot="git+https://github.com/lirios/aurora-client.git"
_gitbranch=develop
_gitname=aurora-client
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
