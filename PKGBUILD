# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-platformtheme-git
pkgver=20170514.1a393c4
pkgrel=1
pkgdesc="Qt platform theme plugin for apps integration with Liri OS"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('GPL3')
depends=('qt5-base' 'qt5-quickcontrols2' 'qt5-gsettings-git' 'liri-workspace-git')
makedepends=('git' 'qbs')
conflicts=('liri-platform-theme')
replaces=('liri-platform-theme')
provides=('liri-platform-theme')
groups=('liri-git')

_gitroot="git://github.com/lirios/platformtheme.git"
_gitbranch=develop
_gitname=platformtheme
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
	qbs build --no-install -d build profile:qt5 qbs.installRoot:/ qbs.installPrefix:usr lirideployment.qmlDir:lib/qt/qml lirideployment.pluginsDir:lib/qt/plugins
}

package() {
	cd ${srcdir}/${_gitname}
	qbs install -d build --no-build -v --install-root $pkgdir profile:qt5
}
