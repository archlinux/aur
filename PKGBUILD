# Maintainer: Samuel Fernando Mesa Giraldo <samuelmesa@linuxmail.org>
# Original Maintainer:: Marcos Piccinini <x@nofxx.com>
# Original Maintainer::  Jonathan Hudson <jh+arch@daria.co.uk>

pkgname=mapserver-git
_pkgname=${pkgname%-git}
pkgver=20220819_b2f0fd240
pkgrel=1
pkgdesc="Platform for publishing spatial data and interactive mapping applications to the web"
arch=(i686 x86_64)
license=('MIT')
url="http://www.mapserver.org"
depends=('libpng' 'freetype2' 'zlib' 'gdal' 'proj' 'libjpeg-turbo' 'libxml2' 'libpqxx' 'pdflib-lite' 'geos' 'agg' 'apache' 'protobuf-c'
'fcgi' 'mod_fcgid' 'python' 'libsvg-cairo' 'fribidi' 'pixman' 'exempi')
## For v8 support require v8-3.20; for PHP mapscript require php, php-pear, php-apache
makedepends=('cfitsio')
conflicts=('mapserver')
options=()
provides=("mapserver=${pkgver}")
source=("$_pkgname"::'git+https://github.com/mapserver/mapserver.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  # Use the tag of the last commit
  #git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
  echo "$(git log -1 --format="%cd" --date=short | tr -d '-')_$(git log -1 --format="%h")"
}

build() {
	cd "$srcdir/$_pkgname"

  if [ -f CMakeCache.txt ]
    then
	  rm -rf CMakeCache.txt CMakeFiles
  fi
  rm -rf build && mkdir build
  cd build

  ## Compile with python
  ## -DPYTHON_LIBRARIES=/usr/lib/python2.7 \
	## -DPYTHON_INCLUDE_PATH=/usr/include/python2.7 \

  cmake .. \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DFRIBIDI_INCLUDE_DIR="/usr/include/glib-2.0;/usr/lib/glib-2.0/include;/usr/include/fribidi" \
  -DCMAKE_PREFIX_PATH=/opt/v8 \
  -DWITH_CAIRO=ON \
	-DWITH_CLIENT_WFS=ON \
	-DWITH_CLIENT_WMS=ON \
	-DWITH_CSHARP=OFF \
	-DWITH_CURL=ON \
	-DWITH_EXEMPI=OFF \
	-DWITH_FCGI=ON \
	-DWITH_FRIBIDI=ON \
	-DWITH_GENERIC_NINT=OFF \
	-DWITH_GEOS=ON \
	-DWITH_GIF=ON \
	-DWITH_ICONV=ON \
	-DWITH_JAVA=OFF \
	-DWITH_KML=ON \
	-DWITH_V8=OFF \
	-DWITH_LIBXML2=ON \
	-DWITH_MSSQL2008=OFF \
	-DWITH_MYSQL=OFF \
	-DWITH_ORACLESPATIAL=OFF \
	-DWITH_ORACLE_PLUGIN=OFF \
	-DWITH_PERL=OFF \
	-DWITH_PHPNG=OFF \
	-DWITH_POSTGIS=ON \
	-DWITH_GIF=ON \
	-DWITH_PYTHON=ON \
  -DWITH_PYMAPSCRIPT_ANNOTATIONS=ON \
	-DWITH_RSVG=OFF \
	-DWITH_RUBY=OFF \
	-DWITH_SOS=ON \
	-DWITH_SVGCAIRO=ON \
	-DWITH_THREAD_SAFETY=ON \
	-DWITH_WCS=ON \
	-DWITH_WFS=ON \
	-DWITH_WMS=ON \
	-DWITH_OGCAPI=ON \
	-DWITH_PIXMAN=ON \
	-DWITH_EXEMPI=ON \
	-DWITH_XMLMAPFILE=OFF \
	-DFREETYPE_INCLUDE_DIR=/usr/include/freetype2 \

  make clean
  make
}

package() {
  cd "$srcdir/$_pkgname/build"

  make DESTDIR=${pkgdir} install

  #Copy the headers a include for ZooWPS project
  install -d "$pkgdir"/usr/include/mapserver
  install -d "$pkgdir"/opt/mapserver
  install -Dm644 $srcdir/$_pkgname//build/*.h "$pkgdir"/usr/include/mapserver/
  install -Dm644 $srcdir/$_pkgname/*.h "$pkgdir"/usr/include/mapserver/
  cp -dpr --no-preserve=ownership $srcdir/$_pkgname/tests "$pkgdir"/opt/mapserver/test
}
