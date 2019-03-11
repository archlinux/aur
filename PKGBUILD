#!/bin/bash
# shellcheck disable=SC2034,SC2164
# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>
_pkgname=dhewm3
pkgname=$_pkgname-git
pkgver=1.5.1_PRE1.r0.g3a763fc
pkgrel=1
epoch=1
pkgdesc="Doom 3 source port"
arch=('x86_64' 'i686')
url="https://dhewm3.org/"
license=('GPL3')
depends=('curl' 'libjpeg' 'libvorbis' 'openal' 'sdl2')
makedepends=('git' 'cmake')
optdepends=('doom3-data: for game data and icon')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/dhewm/dhewm3.git"
        "$_pkgname.desktop")
md5sums=('SKIP'
         'cd3a45168aa702fea871caea05da95b9')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	mkdir -p build
}

build() {
	cd build
	CXXFLAGS=${CXXFLAGS:+$CXXFLAGS }-DLINUX_DEFAULT_PATH='\"/usr/share/games/doom3\"' cmake ../$_pkgname/neo \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DDEDICATED=1
	make
}

package() {
	# shellcheck disable=SC2154
	make -C build DESTDIR="$pkgdir" install
	install -Dm644 -t "$pkgdir"/usr/share/applications $_pkgname.desktop
}
