# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=fluid-git
pkgver=20170321.59b33b6
pkgrel=1
pkgdesc="Components for Qt Quick applications with Material Design and Universal"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('MPL2')
depends=('qt5-quickcontrols2' 'qt5-graphicaleffects' 'qt5-svg')
makedepends=('git' 'qt5-tools')
conflicts=('fluid')
replaces=('fluid')
provides=('fluid')
groups=('liri-git')

_gitroot="git://github.com/lirios/fluid.git"
_gitbranch=develop
_gitname=fluid
source=(${_gitname}::${_gitroot}#branch=${_gitbranch})
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_gitname}
	echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

prepare() {
	mkdir -p build
	pushd ${_gitname} >/dev/null
	./scripts/fetch_icons.sh
	popd >/dev/null
}

build() {
	cd build
	qmake \
		CONFIG+=use_qt_paths \
		CONFIG-=create_prl \
		../${_gitname}
	make
}

package() {
	cd build
	make INSTALL_ROOT="${pkgdir}" install
}
