# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-qbs-shared-git
pkgver=20191001.138.c176452
pkgrel=1
pkgdesc="Extra imports and modules for Qbs"
arch=('any')
url='https://liri.io'
license=('BSD')
depends=('qbs')
makedepends=('git')
conflicts=('liri-qbs-shared')
replaces=('liri-qbs-shared')
provides=('liri-qbs-shared')
groups=('liri-git')

_gitroot="git+https://github.com/lirios/qbs-shared.git"
_gitbranch=develop
_gitname=qbs-shared
source=(${_gitname}::${_gitroot}#branch=${_gitbranch})
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_gitname}
	echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git rev-list --count HEAD).$(git log -1 --format="%h")"
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
	qbs build --no-install -d build profile:qt5 project.prefix:/usr
}

package() {
	cd ${srcdir}/${_gitname}
	qbs install -d build --no-build -v --install-root $pkgdir profile:qt5

	mkdir -p $pkgdir/usr/share/licenses/${pkgname}
	cp LICENSE.BSD $pkgdir/usr/share/licenses/${pkgname}
}
