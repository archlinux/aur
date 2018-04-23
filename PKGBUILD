# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=vibe-git
pkgver=20180412.231.d522045
pkgrel=1
pkgdesc="A collection of QML plugins used throughout Liri"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://liri.io"
license=('LGPL3')
depends=('qt5-base' 'qt5-declarative' 'qt5-tools' 'solid' 'networkmanager-qt'
         'modemmanager-qt' 'pulseaudio' 'polkit-qt5' 'fluid-git' 'libliri-git')
makedepends=('git' 'liri-qbs-shared-git')
options=(debug !strip)
conflicts=('vibe')
replaces=('vibe')
provides=('vibe')
groups=('liri-git')

_gitroot="git://github.com/lirios/vibe.git"
_gitbranch=develop
_gitname=vibe
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
