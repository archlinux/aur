# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-terminal-git
pkgver=20171012.896b06b
pkgrel=1
pkgdesc="Terminal application and modules for Liri OS"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('GPL3')
depends=('vibe-git' 'glib2' 'dconf')
makedepends=('git' 'liri-qbs-shared-git')
conflicts=('hawaii-terminal-git' 'papyros-terminal-git' 'papyros-qmltermwidget-git' 'liri-terminal')
replaces=('hawaii-terminal-git' 'papyros-terminal-git' 'papyros-qmltermwidget-git' 'liri-terminal')
options=(debug !strip)
provides=('liri-terminal')
groups=('liri-git')
install=$pkgname.install

_gitroot="git://github.com/lirios/terminal.git"
_gitbranch=develop
_gitname=terminal
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
	qbs build --no-install -d build profile:qt5 qbs.installRoot:/ qbs.installPrefix:usr modules.lirideployment.qmlDir:lib/qt/qml
}

package() {
	cd ${srcdir}/${_gitname}
	qbs install -d build --no-build -v --install-root $pkgdir profile:qt5
}
