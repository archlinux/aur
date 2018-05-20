# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-networkmanager-git
pkgver=20180519.19.1202dda
pkgrel=1
pkgdesc="Network Manager integration for Liri"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('GPL3')
depends=('fluid-git' 'networkmanager-qt' 'modemmanager-qt')
makedepends=('git' 'liri-qbs-shared-git')
options=(debug !strip)
conflicts=('liri-networkmanager')
replaces=('liri-networkmanager')
provides=('liri-networkmanager')
groups=('liri-git')

_gitroot="git://github.com/lirios/networkmanager.git"
_gitbranch=develop
_gitname=shell
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
	qbs build --no-install -d build config:debug qbs.buildVariant:debug profile:qt5 \
		modules.lirideployment.prefix:/usr \
		modules.lirideployment.qmlDir:/usr/lib/qt/qml \
		modules.lirideployment.pluginsDir:/usr/lib/qt/plugins
}

package() {
	cd ${srcdir}/${_gitname}
	qbs install -d build --no-build -v --install-root $pkgdir config:debug profile:qt5
}
