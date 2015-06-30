# Maintainer: Vladislav Tyulbashev <vladislav.tyulbashev@yandex.ru>

pkgname=qlivebittorrent-git
pkgver=20140909
pkgrel=1
pkgdesc="Simple bittorrent client with very interesting live feature"
arch=('i686' 'x86_64')
url="https://github.com/vtyulb/QLiveBittorrent"
license=('GPL')
depends=('qt5-base' 'boost-libs' 'libtorrent-rasterbar' 'ncurses')
makedepends=('wget' 'unzip' 'fuse' 'geoip' 'libtorrent-rasterbar' 'qt5-base' 'boost')

build() {
  cd ${srcdir}
  rm -fv master.zip
  wget https://github.com/vtyulb/QLiveBittorrent/archive/master.zip
  rm -rfv QLiveBittorrent-master
  unzip master.zip
  cd QLiveBittorrent-master/src/
  gcc -g `pkg-config fuse --cflags --libs` driver.c -o qlivebittorrent-driver
  echo "Disabling portable version"
  cat QLiveBittorrent.pro | grep -v PORTABLE > tmp
  mv tmp QLiveBittorrent.pro
  qmake-qt5 -makefile
  make
}

package() {
  cd ${srcdir}/QLiveBittorrent-master/src/
  mkdir -p $pkgdir/usr/bin
  cp -f QLiveBittorrent $pkgdir/usr/bin/qlivebittorrent
  cp -f qlivebittorrent-driver $pkgdir/usr/bin/qlivebittorrent-driver 
}
