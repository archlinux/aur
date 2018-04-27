# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-workspace-git
pkgver=20180425.268.f1c033c
pkgrel=1
pkgdesc="Liri workspace, programs and plugins"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://liri.io"
license=('GPL3')
depends=('qt5-tools' 'qt5-gstreamer' 'qt5-quickcontrols2' 'qt5-gsettings-git' 'libliri-git' 'liri-wayland-git'
         'solid' 'glib2' 'dconf' 'paper-icon-theme-git' 'liri-wallpapers-git'
         'ttf-dejavu' 'ttf-droid' 'ttf-roboto' 'noto-fonts')
makedepends=('git' 'liri-qbs-shared-git' 'boost')
conflicts=('hawaii-workspace-git' 'liri-workspace')
replaces=('hawaii-workspace-git' 'liri-workspace')
provides=('liri-workspace')
groups=('liri-git')
install=$pkgname.install

_gitroot="git://github.com/lirios/workspace.git"
_gitbranch=develop
_gitname=workspace
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
	qbs build --no-install -d build profile:qt5 \
		modules.lirideployment.prefix:/usr \
		modules.lirideployment.qmlDir:lib/qt/qml
}

package() {
	cd ${srcdir}/${_gitname}
	qbs install -d build --no-build -v --install-root $pkgdir profile:qt5
}
