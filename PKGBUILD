# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=swordfish-git
pkgver=20140309.0f1d929
pkgrel=1
pkgdesc="File manager"
arch=('i686' 'x86_64')
url="http://www.maui-project.org"
license=('GPL')
depends=('qt5-declarative' 'qt5-quickcontrols' 'qt5-tools')
makedepends=('git' 'cmake')
conflicts=('hawaii-swordfish-git')
replaces=('hawaii-swordfish-git')
options=('debug')

_gitroot="git://github.com/mauios/swordfish.git"
_gitname=swordfish
_gitbranch=master
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
		-DCMAKE_BUILD_TYPE=RelWithDebInfo
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install

	# Remove org.freedesktop.FileManager1.service to avoid conflicts
	rm -fr ${pkgdir}/usr/share/dbus-1/services/
}
