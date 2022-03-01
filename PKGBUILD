# Maintainer:Samuel Fernando Mesa Giraldo <samuelmesa [at] linuxmail.org>

pkgname=mapcache
pkgver=1.12.0
pkgrel=1
pkgdesc="A server that implements tile caching to speed up access to WMS layers"
arch=('i686' 'x86_64')
url='https://www.mapserver.org/mapcache/'
license=('LGPL')
depends=( 'libpng' 'apache' 'curl' 'gdal' 'geos' 'libgeotiff' 'db')
optdepends=('geos: Imrpoved vector support' 'riak')
makedepends=('git' 'cmake')
provides=('mapcache')
conflicts=('mapcache')
source=("http://download.osgeo.org/mapserver/mapcache-${pkgver}.tar.gz")
md5sums=('0f8a7f5bb186e745fc19dc23417ede5c')

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
  -DWITH_GEOTIFF=ON \
  -DWITH_TIFF_WRITE_SUPPORT=ON \
  -DWITH_GEOS=ON \
  -DWITH_MAPSERVER=OFF \
  -DWITH_MAPSERVER_INCLUDE_DIR=/usr/include/mapserver \
  -DWITH_MAPSERVER_LIB_DIR=/usr/include/mapserver \
  -DWITH_RIAK=OFF \
  -DWITH_MEMCACHE=ON  \
  -DWITH_OGR=ON  \
  -DWITH_SQLITE=ON

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
  install -Dm755 MIGRATION_GUIDE.txt $pkgdir/usr/share/mapcache
  install -Dm755 LICENSE $pkgdir/usr/share/mapcache  
}
