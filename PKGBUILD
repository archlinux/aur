# Maintainer:Samuel Fernando Mesa Giraldo <samuelmesa [at] linuxmail.org>

pkgname=mapcache
pkgver=1.4.0
pkgrel=1
pkgdesc="A server that implements tile caching to speed up access to WMS layers"
arch=('i686' 'x86_64')
url=('http://www.mapserver.org/en/mapcache')
license=('LGPL')
depends=( 'libpng' 'apache' 'curl' 'gdal' 'geos' 'libgeotiff' 'db')
optdepends=('geos: Imrpoved vector support')
makedepends=('git' 'cmake')
provides=('mapcache')
conflicts=('mapcache')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mapserver/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('9dd46f844604e8cdf12d71d0788f9151')

build() {
  cd ${pkgname}-${pkgver}
  
  if [ -f CMakeCache.txt ]  
    then
	  rm -rf CMakeCache.txt CMakeFiles
  fi	
  rm -rf build && mkdir build
  cd build
  
  msg "Starting make..."
  
  cmake .. \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DWITH_APACHE=ON \
  -DWITH_BERKELEY_DB=ON \
  -DWITH_FCGI=ON \
  -DWITH_TIFF=ON \
  -DWITH_TIFF_WRITE_SUPPORT=ON \
  -DWITH_GEOS=ON \
  -DWITH_MAPSERVER=OFF \
  -DWITH_MEMCACHE=ON  \
  -DWITH_OGR=ON  \
  -DWITH_SQLITE=ON  \

  make
}

package() {
  cd ${pkgname}-${pkgver}
  cd build
  make || return 1
  make DESTDIR=${pkgdir} install
   
  cd ${srcdir}/${pkgname}-${pkgver}

  install -d $pkgdir/usr/share/mapcache
  install -Dm755 mapcache.xml $pkgdir/usr/share/mapcache
  install -Dm755 mapcache.xml.sample $pkgdir/usr/share/mapcache
}
