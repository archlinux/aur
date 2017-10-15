# Maintainer: Andrew Penkrat <contact.aldrog@gmail.com>
# Contributor: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-text-git
pkgver=20171015.1b1b899
pkgrel=1
pkgdesc="Advanced text editor built in accordance with Material Design"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('GPL3')
depends=('fluid-git')
makedepends=('git' 'qbs' 'qt5-tools')
conflicts=('liri-text')
provides=('liri-text')
groups=('liri-git')

_gitroot="git://github.com/lirios/text.git"
_gitbranch=develop
_gitname=text
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
	qbs build --no-install -d build profile:qt5 qbs.installRoot:/ qbs.installPrefix:usr
}

package() {
	cd ${srcdir}/${_gitname}
	qbs install -d build --no-build -v --install-root $pkgdir profile:qt5
}
