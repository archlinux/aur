# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-wallpapers-git
pkgver=20170425.9a114fb
pkgrel=1
pkgdesc="Wallpapers for Liri OS"
arch=('any')
url='https://liri.io'
license=('CCPL')
makedepends=('git' 'qt5-base')
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
	mkdir -p build
	pushd ${_gitname} && git submodule update --init && popd
}

build() {
	cd build
	qmake LIRI_INSTALL_PREFIX=/usr ../${_gitname}/wallpapers.pro
	make
}

package() {
	cd build
	make INSTALL_ROOT="${pkgdir}" install
}
