# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=hawaii-system-preferences-git
pkgver=20150503.4a3ca3e
pkgrel=1
pkgdesc="Hawaii system preferences"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/hawaii-desktop"
license=('GPL')
depends=('qt5-base' 'qt5-declarative' 'xkeyboard-config' 'hawaii-shell-git'
         'polkit-qt5' 'libkscreen')
conflicts=('hawaii-system-preferences')
replaces=('hawaii-system-preferences')
provides=('hawaii-system-preferences')
makedepends=('git' 'extra-cmake-modules' 'qt5-tools')
options=('debug')
groups=('hawaii-git')

_gitroot="git://github.com/hawaii-desktop/hawaii-system-preferences.git"
_gitbranch=master
_gitname=system-preferences
source=(${_gitname}::${_gitroot}#branch=${_gitbranch})
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_gitname}
	echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

prepare() {
	mkdir -p build
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
