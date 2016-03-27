# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=greenisland-git
pkgver=20151115.83e3202
pkgrel=1
pkgdesc="Green Island: Qt-based compositor infrastructure for Wayland"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='http://hawaiios.org'
license=('LGPL3')
depends=('systemd' 'wayland-protocols' 'libdrm' 'libinput' 'qt5-declarative'
         'xkeyboard-config' 'libxkbcommon' 'fontconfig' 'freetype2')
provides=('greenisland')
conflicts=('greenisland')
replaces=('greenisland')
makedepends=('git' 'gdb' 'extra-cmake-modules' 'xcb-util-cursor' 'libxcursor')
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
		-DCMAKE_BUILD_TYPE=RelWithDebInfo
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
