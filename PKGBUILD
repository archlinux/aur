# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=xdg-desktop-portal-liri-git
pkgver=20180802.7.ff7b725
pkgrel=1
pkgdesc="A backend implementation for xdg-desktop-portal for Liri"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('GPL3')
depends=('libliri-git' 'xdg-desktop-portal')
makedepends=('git' 'liri-qbs-shared-git')
conflicts=('xdg-desktop-portal-liri')
replaces=('xdg-desktop-portal-liri')
provides=('xdg-desktop-portal-liri')
groups=('liri-git')

_gitroot="git://github.com/lirios/xdg-desktop-portal-liri.git"
_gitbranch=develop
_gitname=xdg-desktop-portal-liri
source=(${_gitname}::${_gitroot}#branch=${_gitbranch})
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_gitname}
	echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git rev-list --count HEAD).$(git log -1 --format="%h")"
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
