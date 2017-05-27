# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-wayland-git
pkgver=20170514.732a453
pkgrel=1
pkgdesc="QtWayland additions and QPA plugin"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('GPL3')
depends=('systemd' 'wayland-protocols' 'libdrm' 'libinput' 'qt5-declarative' 'qt5-wayland'
         'xkeyboard-config' 'libxkbcommon' 'glib2' 'fontconfig' 'freetype2')
makedepends=('git' 'qbs' 'xcb-util-cursor' 'libxcursor')
conflicts=('greenisland' 'greenisland-git' 'liri-wayland')
replaces=('greenisland' 'greenisland-git' 'liri-wayland')
provides=('liri-wayland')
groups=('liri-git')

_gitroot="git://github.com/lirios/wayland.git"
_gitbranch=develop
_gitname=wayland
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
