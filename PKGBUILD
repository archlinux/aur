# Current Maintainer: Samuel Fernando Mesa Giraldo <samuelmesa@linuxmail.org>
# Original Maintainer:: Marcos Piccinini <x@nofxx.com>
# Original Maintainer::  	Jonathan Hudson <jh+arch@daria.co.uk>

pkgname=mapserver
pkgver=8.0.0
pkgrel=1
pkgdesc="Platform for publishing spatial data and interactive mapping applications to the web"
arch=(i686 x86_64)
license=('MIT')
url="http://www.mapserver.org"
depends=('libpng' 'freetype2' 'zlib' 'gdal' 'proj' 'libjpeg-turbo' 'libxml2' 'libpqxx' 'pdflib-lite' 'geos' 'agg' 'apache' 'protobuf-c'
'fcgi' 'mod_fcgid' 'python' 'libsvg-cairo' 'fribidi' )
## For v8 support require v8-3.20; for PHP mapscript require php, php-pear, php-apache
makedepends=('cfitsio')
options=()
source=("http://download.osgeo.org/mapserver/mapserver-${pkgver}.tar.gz")
md5sums=('47fa5198c3037ffbf1124984240ea853')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  
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
	-DWITH_OGCAPI=ON \
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
	-DWITH_POSTGIS=ON \
	-DWITH_GIF=ON \
	-DWITH_PYTHON=ON \
	-DWITH_RSVG=OFF \
	-DWITH_RUBY=OFF \
	-DWITH_SOS=ON \
	-DWITH_SVGCAIRO=ON \
	-DWITH_THREAD_SAFETY=ON \
	-DWITH_WCS=ON \
	-DWITH_WFS=ON \
	-DWITH_WMS=ON \
	-DWITH_XMLMAPFILE=OFF \
	-DFREETYPE_INCLUDE_DIR=/usr/include/freetype2 \
    
  make clean	
  make -j$(nproc)
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cd build
  
  make || return 1
  make DESTDIR=${pkgdir} install
  
  #Copy the headers a include for ZooWPS project
  install -d "$pkgdir"/usr/include/mapserver
  install -d "$pkgdir"/usr/share/mapserver
  install -d "$pkgdir"/opt/mapserver/test/
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}"/build/*.h "$pkgdir"/usr/include/mapserver/
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}"/*.h "$pkgdir"/usr/include/mapserver/
  cp -rfv "${srcdir}/${pkgname}-${pkgver}"/share/ogcapi "$pkgdir"/usr/share/mapserver
  cp -rfv "${srcdir}/${pkgname}-${pkgver}"/tests/* "$pkgdir"/opt/mapserver/test
}
