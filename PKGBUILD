# Maintainer: Chan Beom Park <cbpark@gmail.com>

_pkgname=LoopTools
pkgname=looptools
pkgver=2.13
pkgrel=9
pkgdesc="package for evaluation of scalar and tensor one-loop integrals"
arch=("i686" "x86_64")
url="http://www.feynarts.de/looptools"
license=('GPL3')
depends=("gcc-fortran")
options=('staticlibs')
source=("http://www.feynarts.de/looptools/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b609720e8ab68d4f4e0c01c19abffff5915fe593362ddbcdd68260c780ef475e')

build() {
  cd "${_pkgname}-${pkgver}"

  ./configure --prefix=/usr CC=/usr/bin/gcc CXX=/usr/bin/g++
  sed -i 's/LIBDIR = $(PREFIX)\/lib$(LIBDIRSUFFIX)/LIBDIR = $(PREFIX)\/lib/' makefile
  flags=( "FFLAGS" "CFLAGS" "CXXFLAGS" )
  for f in "${flags[@]}"; do
    sed -i "s/$f =/$f = -fPIC/" makefile
  done

  make
}

package() {
  cd "${_pkgname}-${pkgver}"

  make PREFIX="$pkgdir/usr" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
