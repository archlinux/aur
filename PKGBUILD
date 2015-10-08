# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

buildarch=20

pkgname=greenisland-rpi-git
pkgver=20150406.c37acd7
pkgrel=1
pkgdesc="Green Island: Qt-based compositor infrastructure for Wayland"
arch=('armv6h' 'armv7h')
url='http://hawaiios.org'
license=('GPL2', 'LGPL2.1')
depends=('qt5-declarative' 'hawaii-qt5-wayland-rpi-git' 'qt5-qpa-rpi-plugin' 'xkeyboard-config')
[ "$CARCH" == 'armv6h' ] && optdepends=('weston: nested mode support')
[ "$CARCH" == 'armv7h' ] && optdepends=('weston-rpi: nested mode support')
provides=('greenisland-git' 'greenisland')
conflicts=('greenisland-git' 'greenisland')
replaces=('greenisland-git' 'greenisland')
makedepends=('git' 'gdb' 'extra-cmake-modules')
options=('debug')

_gitroot="git://github.com/greenisland/greenisland.git"
_gitbranch=master
_gitname=greenisland
source=(${_gitname}::${_gitroot}#branch=${_gitbranch})
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_gitname}
	echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

prepare() {
	mkdir build
}

build() {
	cd build

	cmake ../${_gitname} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLIB_INSTALL_DIR=lib \
		-DLIBEXEC_INSTALL_DIR=lib \
		-DQML_INSTALL_DIR=lib/qt/qml \
		-DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
		-DQtWaylandScanner_EXECUTABLE=/usr/lib/qt/bin/qtwaylandscanner \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
