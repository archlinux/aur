# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-shell-git
pkgver=20161016.c2269e8
pkgrel=1
pkgdesc="QtQuick and Wayland based shell for convergence"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('GPL3')
depends=('qt5-tools' 'qt5-wayland' 'qt5-accountsservice-git' 'qt5-gsettings-git'
         'libqtxdg' 'pam' 'liri-wayland-git' 'libliri-git' 'vibe-git' 'liri-workspace-git')
optdepends=('weston: nested mode support')
makedepends=('git' 'qbs')
conflicts=('hawaii-shell-git' 'papyros-shell-git' 'liri-shell')
replaces=('hawaii-shell-git' 'papyros-shell-git' 'liri-shell')
provides=('liri-shell')
groups=('liri-git')

_gitroot="git://github.com/lirios/shell.git"
_gitbranch=develop
_gitname=shell
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
	qbs build --no-install -d build profile:qt5 qbs.installRoot:/usr lirideployment.qmlDir:lib/qt/qml lirideployment.pluginsDir:lib/qt/plugins
}

package() {
	cd ${srcdir}/${_gitname}
	qbs install -d build --no-build -v --install-root $pkgdir/usr profile:qt5
}
