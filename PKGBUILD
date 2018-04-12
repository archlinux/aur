# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-files-git
pkgver=20180412.149.30462ed
pkgrel=1
pkgdesc="File manager for Liri OS"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('GPL3')
depends=('fluid-git' 'taglib')
makedepends=('git' 'liri-qbs-shared-git' 'qt5-tools')
options=(debug !strip)
conflicts=('liri-files')
replaces=('liri-files')
provides=('liri-files')
groups=('liri-git')

_gitroot="git://github.com/lirios/files.git"
_gitbranch=develop
_gitname=files
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
	qbs build --no-install -d build profile:qt5 \
		modules.lirideployment.prefix:/usr \
		modules.lirideployment.qmlDir:/usr/lib/qt/qml
}

package() {
	cd ${srcdir}/${_gitname}
	qbs install -d build --no-build -v --install-root $pkgdir profile:qt5
}
