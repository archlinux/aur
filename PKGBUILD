# $Id: PKGBUILD 154188 2015-12-22 11:46:52Z bpiotrowski $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: damir <damir@archlinux.org>

pkgname=gpsdrive
pkgver=2.11
_pkgver=20150407
pkgrel=32
pkgdesc="A car (bike, ship, plane) navigation system"
arch=("i686" "x86_64")
url="http://www.gpsdrive.de/"
license=('GPL2')
depends=('gtk2' 'gpsd' 'libxml2' 'curl' 'python2' 'boost-libs' 'gdal' 'mapnik' 'postgresql-libs' 'openstreetmap-map-icons-svn'
         'perl-date-manip' 'perl-timedate' 'perl-dbi' 'perl-file-slurp' 'perl-www-mechanize' 'perl-libwww' 'perl-uri'
         'perl-text-query' 'perl-www-curl' 'perl-xml-parser' 'perl-xml-simple' 'perl-xml-twig' 'perl-xml-writer')
makedepends=('cmake>=2.4.4' 'boost' 'cfitsio')
install="gpsdrive.install"
#source=("http://www.gpsdrive.de/packages/${pkgname}-${pkgver}.tar.gz")
source=("http://arch.p5n.pp.ru/~sergej/dl/2015/${pkgname}-${_pkgver}.tar.xz"
	"gpsdrive-perltovendor.patch"
	"gpsd-3.14.patch")
md5sums=('c363e751ba1e70e49b198a1889142ca5'
         'c28bc2dc51a76a39161bf540aebfab6c'
         '77fa3d6b0437cff54505aedde7ab7230')

prepare() {
  cd "$srcdir"
  # python2 fix
  for file in $(find . -name '*.py' -print); do
    sed -i 's_#!/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' $file
  done
  sed -i 's|GdkGC \*kontext_map;|extern GdkGC *kontext_map;|' $srcdir/gpsdrive-${_pkgver}/src/gpsdrive.c
  sed -i '22,1i#include <mapnik/graphics.hpp>' $srcdir/gpsdrive-${_pkgver}/src/mapnik.cpp
  sed -i 's|datasource_cache::instance()->|datasource_cache::instance().|' $srcdir/gpsdrive-${_pkgver}/src/mapnik.cpp
  cd gpsdrive-${_pkgver}
  patch -p1 <$srcdir/gpsdrive-perltovendor.patch
  patch -p1 <$srcdir/gpsd-3.14.patch
}

build() {
  cd "$srcdir"

  mkdir -p build
  cd build

  export CFLAGS=-I/usr/include/gdk-pixbuf-2.0/
  export CPPFLAGS=-I/usr/include/gdk-pixbuf-2.0/
  export CXXFLAGS=-I/usr/include/gdk-pixbuf-2.0/
  export LDFLAGS="`pkg-config --libs gtk+-2.0 gmodule-2.0` -lboost_system -lboost_thread"

  # see DefineOptions.cmake for a list of common options and defaults
  # cmake -L for a more in-depth listing
  cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX="/usr" \
    -DWITH_SCRIPTS=ON \
    -DWITH_MAPNIK=ON \
    -DWITH_POSTGIS=ON \
    -DWITH_GDAL=ON \
    -DWITH_BASEMAPS=ON \
    -DWITH_FRIENDSD=ON \
    -DWITH_KISMET=ON \
    -DWITH_NAVIGATION=ON \
    -DWITH_SPEECH=OFF \
    -DWITH_DBUS=OFF \
    -DLIBGPS_OLD=OFF \
    -DFREETYPE2_INCLUDE_DIRS=/usr/include/freetype2 \
    -DFREETYPE2_LIBRARIES=/usr/lib \
    "$srcdir/gpsdrive-${_pkgver}"
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
}
