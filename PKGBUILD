# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=qt5-gsettings-git
pkgver=20171012.81.cd3bf37
pkgrel=1
pkgdesc="Qt-style wrapper for GSettings"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('LGPL3')
depends=('qt5-declarative' 'glib2')
makedepends=('git' 'liri-qbs-shared-git')
conflicts=('qt5-gsettings')
replaces=('qt5-gsettings')
provides=('qt5-gsettings')
groups=('liri-git')

_gitroot="git://github.com/lirios/qtgsettings.git"
_gitbranch=develop
_gitname=qtgsettings
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
	qbs build --no-install -d build profile:qt5 qbs.installRoot:/ qbs.installPrefix:usr modules.lirideployment.qmlDir:lib/qt/qml
}

package() {
	cd ${srcdir}/${_gitname}
	qbs install -d build --no-build -v --install-root $pkgdir profile:qt5
}
