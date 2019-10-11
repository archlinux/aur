# Maintainer: Samuel Mesa <samuelmesa dot gmail.com>
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Brian Galey <bkgaley at gmail dot com>
# Contributor: Pietro Zambelli <peter.zamb at gmail dot com>

pkgname=libspatialite-devel
_pkgname=libspatialite
pkgver=r960.a02cd88
pkgrel=1
pkgdesc="SQLite extension to support spatial data types and operations. Development version"
arch=('x86_64')
url="https://www.gaia-gis.it/fossil/libspatialite"
license=('MPL' 'GPL' 'LGPL')
depends=('geos' 'libfreexl' 'libxml2' 'proj' 'sqlite' 'librttopo')
makedepends=('fossil')
conflicts=('libspatialite')
provides=('libspatialite')
replaces=('libspatialite')

prepare() {
  mkdir -p $_pkgname
  cd $_pkgname

  fossil clone https://www.gaia-gis.it/fossil/libspatialite libspatialite.fossil
  fossil open libspatialite.fossil
}

pkgver() {
  cd $_pkgname

  _hash=$(fossil info | sed -n 's/checkout: *\([0-9a-z]*\).*/\1/p' | cut -c 1-7)
  _revision=$(fossil info | sed -n 's/check-ins: *\(.*\)/\1/p')
  printf "r%s.%s" "$_revision" "$_hash"
}


build() {
  cd $_pkgname

  ./configure --prefix=/usr --enable-libxml2 --enable-rttopo --enable-gcp
  make
}

package() {
  cd $_pkgname

  make DESTDIR="${pkgdir}" install
}
