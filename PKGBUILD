# Maintainer: Jake <aur@ja-ke.tech>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Hans Janssen <hans@janserv.xs4all.nl>

pkgname=simgear
pkgver=2018.3.2
_pkgver=${pkgver%.*}
pkgrel=2
pkgdesc="A set of open-source libraries designed to be used as building blocks for quickly assembling 3d simulations, games, and visualization applications."
arch=(x86_64)
depends=('glu' 'glut' 'freealut' 'plib' 'openscenegraph34')
makedepends=('boost' 'cmake' 'mesa')
license=("GPL")
url="http://www.flightgear.org/"
options=('makeflags' 'staticlibs')
source=("https://downloads.sourceforge.net/project/flightgear/release-${_pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('c8b094a8c5045362848781f72117dbec424472bf6b9dd135dfe43f9b915781a4')

prepare() {
  cd "$srcdir"/simgear-$pkgver
  sed -i -e "s|#include <simgear/structure/map.hxx>|#include <simgear/structure/map.hxx>\n#include <boost/utility/enable_if.hpp>|g" simgear/nasal/cppbind/NasalHash.hxx
}

build() {
  cd "$srcdir"/simgear-$pkgver
  mkdir ../sgbuild && cd ../sgbuild
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=Release -DENABLE_TESTS=off ../simgear-${pkgver}
  make
}

package() {
  cd "$srcdir"/sgbuild
  make DESTDIR="$pkgdir" install
}
