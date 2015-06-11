# Maintainer: Samuel Mesa <samuelmesa@linuxmail.org>
# Contributor: Marcos Piccinini <x@nofxx.com>
# Contributor:  	Jonathan Hudson <jh+arch@daria.co.uk>
pkgname=mapserver-git
pkgver=7.0.0.beta1.r28.g61592a7
pkgrel=1
pkgdesc="Platform for publishing spatial data and interactive mapping applications to the web"
arch=(i686 x86_64)
license=('MIT')
url="http://www.mapserver.org"
depends=('libpng' 'freetype2' 'gd' 'zlib' 'gdal' 'proj' 'libjpeg-turbo' 'libxml2' 'libpqxx' 'pdflib-lite' 'geos' 'agg' 'apache' 'fcgi' 'mod_fastcgi' 'python2' 'swig' 'libsvg-cairo')
makedepends=('cfitsio')
options=()
provides=("${pkgname}=${pkgver}")
conflicts=('mapserver')
source=("${pkgname}"::'git://github.com/mapserver/mapserver.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/^rel-//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}/${pkgname}
  
  if [ -f CMakeCache.txt ]  
    then
	  rm -rf CMakeCache.txt CMakeFiles
  fi	
  rm -rf build && mkdir build
  cd build
  
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
	-DPYTHON_EXECUTABLE=/usr/bin/python2 \
	-DPYTHON_LIBRARIES=/usr/lib/python2.7 \
	-DPYTHON_INCLUDE_PATH=/usr/include/python2.7 \
	-DFRIBIDI_INCLUDE_DIR="/usr/include/glib-2.0;/usr/lib/glib-2.0/include;/usr/include/fribidi" \
    -DWITH_CAIRO=ON \
	-DWITH_CLIENT_WFS=ON \
	-DWITH_CLIENT_WMS=ON \
	-DWITH_CSHARP=OFF \
	-DWITH_CURL=ON \
	-DWITH_EXEMPI=OFF \
	-DWITH_FCGI=ON \
	-DWITH_FRIBIDI=ON \
	-DWITH_GD=OFF \
	-DWITH_GDAL=ON \
	-DWITH_GENERIC_NINT=OFF \
	-DWITH_GEOS=ON \
	-DWITH_GIF=OFF \
	-DWITH_ICONV=ON \
	-DWITH_JAVA=OFF \
	-DWITH_KML=ON \
	-DWITH_LIBXML2=ON \
	-DWITH_MSSQL2008=OFF \
	-DWITH_MYSQL=OFF \
	-DWITH_OGR=ON \
	-DWITH_ORACLESPATIAL=OFF \
	-DWITH_ORACLE_PLUGIN=OFF \
	-DWITH_PERL=OFF \
	-DWITH_PHP=OFF \
	-DWITH_POINT_Z_M=OFF \
	-DWITH_POSTGIS=ON \
	-DWITH_PROJ=ON \
	-DWITH_PYTHON=ON \
	-DWITH_RSVG=OFF \
	-DWITH_RUBY=OFF \
	-DWITH_SDE=OFF \
	-DWITH_SDE_PLUGIN=OFF \
	-DWITH_SOS=ON \
	-DWITH_SVGCAIRO=ON \
	-DWITH_THREAD_SAFETY=ON \
	-DWITH_WCS=ON \
	-DWITH_WFS=ON \
	-DWITH_WMS=ON \
	-DWITH_XMLMAPFILE=OFF \
	-DFREETYPE_INCLUDE_DIR=/usr/include/freetype2 \
    
  make clean
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  cd build
  
  make || return 1
  make DESTDIR=${pkgdir} install
  
  # Copy the headers a include for ZooWPS project
  mkdir -p "$pkgdir"/usr/include/mapserver  
  cp "${srcdir}/${pkgname}"/*.h "${pkgdir}"/usr/include/mapserver/

  # Move stuff from lib64 to lib
  mv "${pkgdir}"/usr/lib64/* "${pkgdir}"/usr/lib
  rm -r "${pkgdir}"/usr/lib64
}
