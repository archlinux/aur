# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=jazz
pkgver=r840
pkgrel=2
pkgdesc="A fairly standard chess program"
arch=('i686' 'x86_64')
url="http://www.eglebbk.dds.nl/program/chess-index.html"
license=('GPL3')
depends=('readline')
makedepends=('cmake')
source=("http://www.eglebbk.dds.nl/program/download/${pkgname}-${pkgver#r}-src.tar.gz"
        "install-lib.patch")
md5sums=('0a5cfb8b90aca975ab651f53a12f78bc'
         'c9027d0eb853221601ad0d4886c1699e')

prepare() {
  cd "${srcdir}/Jazz"

  patch -Np1 -i "${srcdir}/install-lib.patch"
}

build() {
  cd "${srcdir}/Jazz"

  [ -d build ] && rm -rf build
  mkdir build && cd build
  # GUI requires at least Allegro 5.1 which is still unstable atm
  # UCI just fails, need to find out why
  cmake .. \
      -DWANT_DYNAMIC=ON \
      -DWANT_GUI=OFF \
      -DWANT_UCI=OFF \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/Jazz/build"

  make DESTDIR="${pkgdir}" install
}
