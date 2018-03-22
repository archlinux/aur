#!/bin/bash
# shellcheck disable=SC2034,SC2164
# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Pierre Choffet <peuc@wanadoo.fr>
_pkgname=ring-kde
pkgname=$_pkgname-git
pkgver=2.0.0.r626.g7790658e
pkgrel=1
pkgdesc="The KDE client for the Ring communication framework (www.ring.cx)"
arch=('x86_64')
url="https://ring.cx/"
license=('GPL')
groups=('ring')
depends=('libringqt' 'knotifyconfig' 'kdeclarative' 'kirigami2')
makedepends=('git' 'extra-cmake-modules' 'kdoctools')
provides=("$_pkgname")
conflicts=("$_pkgname")
changelog="ChangeLog"
source=('git://anongit.kde.org/ring-kde.git')
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	mkdir -p build
	# fix missing tray icon
	sed -i 's/setIconByPixmap(.*);/setIconByName("ring-kde");/' \
		"$_pkgname"/src/widgets/systray.cpp
}

build() {
	cd build
	cmake ../"$_pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd build
	# shellcheck disable=SC2154
	make DESTDIR="$pkgdir" install
}
