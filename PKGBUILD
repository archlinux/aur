# Maintainer: Alexander Fetting <deeznuts420692@proton.me>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Ashley Whetter <(firstname) @ awhetter.co.uk>
# Contributor: Deon Spengler <deon at spengler dot co dot za>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Hans Janssen <hans@janserv.xs4all.nl>
pkgname=flightgear
pkgver=2024.1.2
pkgrel=1
pkgdesc="An open-source, multi-platform flight simulator"
arch=('x86_64')
conflicts=('flightgear-git')
depends=('openxr' 'qt6-declarative' 'zlib' 'openscenegraph' 'openal' 'simgear=${pkgver}')
makedepends=('cmake' 'boost' 'qt6-svg' 'plib')
optdepends=('flightgear-data: Base data package')
license=("GPL-2.0-or-later")
url="http://www.flightgear.org/"
source=("https://gitlab.com/flightgear/flightgear/-/archive/${pkgver}/flightgear-${pkgver}.tar.gz")
sha256sums=('ce6ed9d655fc53e5c6017034fcd1cbb2c71813023fb2427bd6f77049d7e1e415')

prepare() {
  mv $srcdir/flightgear-${pkgver} $srcdir/flightgear
  mkdir -p $srcdir/fgbuild
  cd $srcdir/flightgear
  sed -i 's|Exec=.*|Exec=fgfs --fg-root=/usr/share/flightgear/data|' package/org.flightgear.FlightGear.desktop.in
}

build() {
  cd $srcdir/fgbuild
  cmake ../flightgear \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFG_DATA_DIR=/usr/share/flightgear/data
  make
}

package() {
  cd $srcdir/fgbuild
  make DESTDIR=$pkgdir install
  mkdir -p $pkgdir/usr/share
  cp -R $pkgdir/usr/appdir/usr/share/* $pkgdir/usr/share/
  rm -rf $pkgdir/usr/appdir
}
