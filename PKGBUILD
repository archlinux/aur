# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-screenshot-git
pkgver=20180707.87.7f4a30d
pkgrel=1
pkgdesc="Take pictures of your screen"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('GPL3')
depends=('fluid-git')
makedepends=('git' 'liri-qbs-shared-git')
options=(debug !strip)
conflicts=('liri-screenshot')
replaces=('liri-screenshot')
provides=('liri-screenshot')
groups=('liri-git')

_gitroot="git://github.com/lirios/screenshot.git"
_gitbranch=develop
_gitname=screenshot
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
	qbs build --no-install -d build config:debug qbs.buildVariant:debug profile:qt5 \
		modules.lirideployment.prefix:/usr \
		modules.lirideployment.qmlDir:/usr/lib/qt/qml \
		modules.lirideployment.pluginsDir:/usr/lib/qt/plugins
}

package() {
	cd ${srcdir}/${_gitname}
	qbs install -d build --no-build -v --install-root $pkgdir config:debug profile:qt5
}
