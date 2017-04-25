# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=qt5-accountsservice-git
pkgver=20170425.32acabd
pkgrel=1
pkgdesc="Qt-style wrapper for Accounts Service"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('LGPL3')
depends=('qt5-declarative')
makedepends=('git')
conflicts=('qtaccountsservice-git' 'qt5-accountsservice')
replaces=('qtaccountsservice-git' 'qt5-accountsservice')
provides=('qt5-accountsservice')
groups=('liri-git')

_gitroot="git://github.com/lirios/qtaccountsservice.git"
_gitbranch=develop
_gitname=qtaccountsservice
source=(${_gitname}::${_gitroot}#branch=${_gitbranch})
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_gitname}
	echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

prepare() {
	mkdir -p build
	pushd ${_gitname} && git submodule update --init && popd
}

build() {
	cd build
	qmake \
		CONFIG+=use_qt_paths \
		../${_gitname}/qtaccountsservice.pro
	make
}

package() {
	cd build
	make INSTALL_ROOT="${pkgdir}" install
}
