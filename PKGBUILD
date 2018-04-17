# Maintainer: Johan Klokkhammer Helsing <johanhelsing@gmail.com>

pkgname=wayland-log-reader
pkgver=20180417.13.449a902
pkgrel=1
pkgdesc="Application for navigating and making sense of WAYLAND_DEBUG log output"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://github.com/johanhelsing/wayland-log-reader'
license=('GPL3')
depends=('qt5-base' 'qt5-quickcontrols2')
makedepends=('git' 'qbs')

_gitroot="git://github.com/johanhelsing/wayland-log-reader.git"
_gitbranch=master
_gitname=$pkgname
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
	qbs build --no-install -d build profile:qt5
}

package() {
	cd ${srcdir}/${_gitname}
	qbs install -d build --no-build --install-root $pkgdir -v profile:qt5
}
