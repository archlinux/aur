# Maintainer: Jose Riha <jose 1711 gmail com>

pkgname=lib32-coin-or-cgl
pkgver=0.60.3
pkgrel=1
pkgdesc="COIN-OR Cut Generation Library (32bit)"
arch=(x86_64)
# url="https://projects.coin-or.org/Cgl"
url="https://github.com/coin-or/Cgl"
license=(EPL)
groups=(coin-or)
depends=(coin-or-clp)
source=("https://www.coin-or.org/download/source/Cgl/Cgl-${pkgver}.tgz")
sha256sums=('cf11e3476d2182040cec412abb232d8bafa12ff5b619eca3b7b9ac1d220476c8')

build() {
  cd Cgl-$pkgver/Cgl
  COIN_SKIP_PROJECTS="Sample" \
  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  ./configure --prefix=/usr \
              --with-osi-lib="$(pkg-config --libs osi)" \
              --with-osi-incdir="/usr/include/coin/" \
              --with-clp-lib="$(pkg-config --libs clp)" \
              --with-clp-incdir="/usr/include/coin/" \
              --with-coinutils-lib="$(pkg-config --libs coinutils)" \
              --with-coinutils-incdir="/usr/include/coin/" \
              --enable-dependency-linking
  make
}

check() {
  cd Cgl-$pkgver/Cgl
  make test
}

package() {
  cd Cgl-$pkgver/Cgl
  PKG_CONFIG_LIBDIR="$pkgdir"/usr/lib/pkgconfig/ \
  make DESTDIR="$pkgdir" install
  mv "${pkgdir}/usr/lib" "${pkgdir}/usr/lib32"
  rm -rf "${pkgdir}"/{etc,usr/{share,bin,include}}
}
