# Maintainer: Samuel Fernando Mesa <samuelmesa dot linuxmail.org>

pkgname=virtualpg-devel
_pkgname=virtualpg
pkgver=r15.5e528ed
pkgrel=1
pkgdesc="VirtualPG is a loadable dynamic extension to both SQLite and SpatiaLite."
url="https://www.gaia-gis.it/fossil/virtualpg/index"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('libspatialite' 'sqlite' 'postgresql-libs' 'postgis')
makedepends=('fossil')
conflicts=('virtualpg')
provides=('virtualpg')
replaces=('virtualpg')

prepare() {
  mkdir -p $_pkgname
  cd $_pkgname

  fossil clone https://www.gaia-gis.it/fossil/virtualpg virtualpg.fossil
  fossil open virtualpg.fossil
}

pkgver() {
  cd $_pkgname

  _hash=$(fossil info | sed -n 's/checkout: *\([0-9a-z]*\).*/\1/p' | cut -c 1-7)
  _revision=$(fossil info | sed -n 's/check-ins: *\(.*\)/\1/p')
  printf "r%s.%s" "$_revision" "$_hash"
}

build() {
  cd ${_pkgname}
  ./configure --prefix="/usr"
  make 
}

package() {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}" install
}
