# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-appcenter-git
pkgver=20171209.114.c5ff5a2
pkgrel=1
pkgdesc="App Center for Liri OS"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('GPL3')
depends=('fluid-git' 'libliri-git' 'karchive' 'flatpak')
makedepends=('git' 'liri-qbs-shared-git')
options=(debug !strip)
conflicts=('liri-appcenter')
replaces=('liri-appcenter')
provides=('liri-appcenter')
groups=('liri-git')

_gitroot="git://github.com/lirios/appcenter.git"
_gitbranch=develop
_gitname=appcenter
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
	qbs build --no-install -d build profile:qt5 qbs.installRoot:/ qbs.installPrefix:usr modules.lirideployment.qmlDir:lib/qt/qml
}

package() {
	cd ${srcdir}/${_gitname}
	qbs install -d build --no-build -v --install-root $pkgdir profile:qt5
}
