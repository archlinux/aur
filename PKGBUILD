# Maintainer: Samuel Fernando Mesa <samuelmesa dot linuxmail.org>

pkgname=librasterlite2-devel
_pkgname=librasterlite2
pkgver=r164.5ebd747
pkgrel=1
pkgdesc="librasterlite2 is an open source library that stores and retrieves huge raster coverages using a SpatiaLite DBMS."
url="https://www.gaia-gis.it/fossil/librasterlite2/index"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('libspatialite-devel' 'libpng'  'proj' 'openjpeg2' 'charls1')
makedepends=('fossil')
provides=("librasterlite2")
conflicts=("librasterlite2")
replaces=("librasterlite2")

prepare() {
  mkdir -p ${_pkgname}
  cd ${_pkgname}

  fossil clone https://www.gaia-gis.it/fossil/librasterlite2 librasterlite2.fossil
  fossil open librasterlite2.fossil
}

pkgver() {
  cd ${_pkgname}

  _hash=$(fossil info | sed -n 's/checkout: *\([0-9a-z]*\).*/\1/p' | cut -c 1-7)
  _revision=$(fossil info | sed -n 's/check-ins: *\(.*\)/\1/p')
  printf "r%s.%s" "$_revision" "$_hash"
}

build() {
  cd ${_pkgname}
  ./configure --prefix="/usr"
  make -j2
}

package() {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}" install
}
