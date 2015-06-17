# Maintainer:Samuel Mesa <samuelmesa [at] linuxmail.org>

pkgname=mapcache
pkgver=1.2.1
pkgrel=1
pkgdesc="A server that implements tile caching to speed up access to WMS layers"
arch=('i686' 'x86_64')
url=('http://www.mapserver.org/en/mapcache')
license=('LGPL')
depends=( 'libpng' 'apache' 'curl' 'gdal' 'geos' 'libgeotiff' 'db')
optdepends=('geos: Imrpoved vector support')
makedepends=('git' 'cmake')
provides=('mapserver')
conflicts=('mapcache')

_gitroot='git://github.com/mapserver/mapcache.git'
_gitname='mapcache'
_gitbranch="branch-1-2"

build() {

  cd $srcdir

  msg "Connecting to $_gitname GIT server...."

  if [[ -d $_gitname ]] ; then
	cd $_gitname && git pull origin $_gitbranch
	msg "The local files are updated."
  else
	git clone $_gitroot --branch $_gitbranch
  fi

 
  msg "GIT checkout done or server timeout"

  cd $srcdir/$pkgname
  
  if [ -d "build" ]; then
    rm -rf build
  fi
  
  mkdir build
  cd build  
  
  msg "Starting make..."
  
  cmake .. \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DWITH_APACHE=1 \
  -DWITH_BERKELEY_DB=1 \
  -DWITH_FCGI=1 \
  -DWITH_TIFF=1 \
  -DWITH_TIFF_WRITE_SUPPORT=1 \
  -DWITH_GEOS=1 \
  -DWITH_MAPSERVER=0 \
  -DWITH_MEMCACHE=1  \
  -DWITH_OGR=1  \
  -DWITH_SQLITE=1  \

  make
}

package() {
  cd $srcdir/$pkgname
  cd build
  make || return 1
  make DESTDIR=${pkgdir} install
   
  cd $srcdir/$pkgname

  mkdir -p $pkgdir/usr/share/mapcache
  cp -r mapcache.xml $pkgdir/usr/share/mapcache
  cp -r mapcache.xml.sample $pkgdir/usr/share/mapcache
}
