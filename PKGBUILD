# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=qt5-gsettings-git
pkgver=20181130.102.a368ce3
pkgrel=1
pkgdesc="Qt-style wrapper for GSettings"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('LGPL3')
depends=('qt5-declarative' 'glib2')
makedepends=('git' 'liri-cmake-shared-git')
conflicts=('qt5-gsettings')
replaces=('qt5-gsettings')
provides=('qt5-gsettings')
groups=('liri-git')

_gitroot="git://github.com/lirios/qtgsettings.git"
_gitbranch=develop
_gitname=qtgsettings
source=(${_gitname}::${_gitroot}#branch=${_gitbranch})
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_gitname}
	echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git rev-list --count HEAD).$(git log -1 --format="%h")"
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
