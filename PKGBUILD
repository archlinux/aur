# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=libliri-git
pkgver=20170527.bbf7f58
pkgrel=1
pkgdesc="Utilities for Liri Quick applications"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('LGPL3')
depends=('qt5-declarative' 'libqtxdg')
makedepends=('git' 'qbs')
conflicts=('libliri')
replaces=('libliri')
provides=('libliri')
groups=('liri-git')

_gitroot="git://github.com/lirios/libliri.git"
_gitbranch=develop
_gitname=libliri
source=(${_gitname}::${_gitroot}#branch=${_gitbranch})
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_gitname}
	echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

prepare() {
	cd ${srcdir}/${_gitname}
	git submodule update --init
}

build() {
	cd ${srcdir}/${_gitname}
	qbs setup-toolchains --type gcc /usr/bin/g++ gcc
	qbs setup-qt /usr/bin/qmake-qt5 qt5
	qbs config profiles.qt5.baseProfile gcc
	qbs build --no-install -d build profile:qt5 qbs.installRoot:/ qbs.installPrefix:usr lirideployment.qmlDir:lib/qt/qml
}

package() {
	cd ${srcdir}/${_gitname}
	qbs install -d build --no-build -v --install-root $pkgdir profile:qt5
}
