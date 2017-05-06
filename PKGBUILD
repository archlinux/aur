# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-wallpapers-git
pkgver=20170505.1326b20
pkgrel=1
pkgdesc="Wallpapers for Liri OS"
arch=('any')
url='https://liri.io'
license=('CCPL')
makedepends=('git' 'qbs')
conflicts=('hawaii-wallpapers-git' 'liri-wallpapers')
replaces=('hawaii-wallpapers-git' 'liri-wallpapers')
provides=('liri-wallpapers')
groups=('liri-git')

_gitroot="git://github.com/lirios/wallpapers.git"
_gitbranch=develop
_gitname=wallpapers
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
	qbs build --no-install -d build profile:qt5 qbs.installRoot:/usr
}

package() {
	cd ${srcdir}/${_gitname}
	qbs install -d build --no-build -v --install-root $pkgdir/usr profile:qt5
}
