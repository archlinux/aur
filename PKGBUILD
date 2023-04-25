pkgname=coin-or-bonmin
pkgver=1.8.9
pkgrel=1
pkgdesc="Experimental open-source C++ code for solving general MINLP problems"
arch=('x86_64')
url="https://projects.coin-or.org/Bonmin"
license=('EPL')
groups=('coin-or')
depends=('coin-or-cbc' 'coin-or-ipopt')
makedepends=('nauty')
source=("https://github.com/coin-or/Bonmin/archive/refs/tags/releases/${pkgver}.tar.gz")
sha256sums=('8d130430a2776e250e941ee16f51dba301d5f0a00cc288e05f5b985cf1f426cd')

prepare() {
  cd "$srcdir/Bonmin-releases-$pkgver"
}

build() {
  cd "$srcdir/Bonmin-releases-$pkgver"
  CXXFLAGS="${CXXFLAGS} -I/usr/include/coin" \
  ./configure --prefix=/usr \
              --with-osi-lib="$(pkg-config --libs osi)" \
              --with-osi-incdir="/usr/include/coin/" \
              --with-clp-lib="$(pkg-config --libs clp)" \
              --with-clp-incdir="/usr/include/coin/" \
              --with-cgl-lib="$(pkg-config --libs cgl)" \
              --with-cgl-incdir="/usr/include/coin/" \
              --with-coinutils-lib="$(pkg-config --libs coinutils)" \
              --with-coinutils-incdir="/usr/include/coin/" \
              --with-cbc-lib="$(pkg-config --libs cbc)" \
              --with-cbc-incdir="/usr/include/coin/" \
              --with-ipopt-lib="$(pkg-config --libs ipopt)" \
              --with-ipopt-incdir="/usr/include/coin/"
  make
}

check() {
  cd "$srcdir/Bonmin-releases-$pkgver"
  make test
}

package() {
  cd "$srcdir/Bonmin-releases-$pkgver"
  PKG_CONFIG_LIBDIR="${pkgdir}/usr/lib/pkgconfig/" \
  make DESTDIR="$pkgdir/" install
}

