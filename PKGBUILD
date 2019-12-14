# Current Maintainer: Samuel Fernando Mesa Giraldo <samuelmesa@linuxmail.org>
# Original Maintainer:: Marcos Piccinini <x@nofxx.com>
# Original Maintainer::  	Jonathan Hudson <jh+arch@daria.co.uk>

pkgname=mapserver
pkgver=7.4.2
pkgrel=2
pkgdesc="Platform for publishing spatial data and interactive mapping applications to the web"
arch=(i686 x86_64)
license=('MIT')
url="http://www.mapserver.org"
depends=('libpng' 'freetype2' 'zlib' 'gdal' 'proj' 'libjpeg-turbo' 'libxml2' 'libpqxx' 'pdflib-lite' 'geos' 'agg' 'apache' 'protobuf-c'
'fcgi' 'mod_fcgid' 'python2' 'swig3' 'libsvg-cairo' 'fribidi' )
## For v8 support require v8-3.20; for PHP mapscript require php, php-pear, php-apache
makedepends=('cfitsio')
options=()
source=("http://download.osgeo.org/mapserver/mapserver-${pkgver}.tar.gz")
md5sums=('500c44fa1954af0c6a201ff4cae5235b')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  
  if [ -f CMakeCache.txt ]  
    then
	  rm -rf CMakeCache.txt CMakeFiles
  fi	
  rm -rf build && mkdir build
  cd build
  
	#-DPYTHON_EXECUTABLE=/usr/bin/python2 \
	#-DPYTHON_LIBRARIES=/usr/lib/python2.7 \
	#-DPYTHON_INCLUDE_PATH=/usr/include/python2.7 \  
  
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DPYTHON_EXECUTABLE=/usr/bin/python \
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
	-DWITH_GDAL=ON \
	-DWITH_GENERIC_NINT=OFF \
	-DWITH_GEOS=ON \
	-DWITH_GIF=OFF \
	-DWITH_ICONV=ON \
	-DWITH_JAVA=OFF \
	-DWITH_KML=ON \
	-DWITH_V8=OFF \
	-DWITH_LIBXML2=ON \
	-DWITH_MSSQL2008=OFF \
	-DWITH_MYSQL=OFF \
	-DWITH_OGR=ON \
	-DWITH_ORACLESPATIAL=ON \
	-DWITH_ORACLE_PLUGIN=OFF \
	-DWITH_PERL=OFF \
	-DWITH_PHP=OFF \
	-DWITH_POINT_Z_M=ON \
	-DWITH_POSTGIS=ON \
	-DWITH_PROJ=ON \
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
	-DSWIG_EXECUTABLE="/usr/bin/swig-3" \
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
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}"/build/*.h "$pkgdir"/usr/include/mapserver/
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}"/*.h "$pkgdir"/usr/include/mapserver/
}
