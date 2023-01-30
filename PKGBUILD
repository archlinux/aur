# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=xdg-desktop-portal-liri-git
pkgver=r84.dba7279
pkgrel=1
pkgdesc="A backend implementation for xdg-desktop-portal for Liri"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('GPL3')
depends=('qt5-accountsservice-git' 'qt5-gsettings-git' 'libliri-git' 'fluid-git' 'aurora-client-git' 'xdg-desktop-portal')
makedepends=('git' 'liri-cmake-shared-git')
conflicts=('xdg-desktop-portal-liri')
replaces=('xdg-desktop-portal-liri')
provides=('xdg-desktop-portal-liri' 'xdg-desktop-portal-impl')
groups=('liri-git')

_gitroot="git+https://github.com/lirios/xdg-desktop-portal-liri.git"
_gitbranch=develop
_gitname=xdg-desktop-portal-liri
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
