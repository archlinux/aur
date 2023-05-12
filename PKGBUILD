# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Felix Golatofski <felix.golatofski@gmx.de>
# Contributor: Daniel YC Lin <dlin.tw at gmail>
_base=SYMPHONY
pkgname=coin-or-${_base,,}
pkgver=5.7.1
pkgrel=1
pkgdesc="COIN-OR solver for mixed-integer linear programs (MILPs)"
arch=(i686 x86_64)
url="https://github.com/coin-or/${_base}"
license=(EPL)
depends=(coin-or-cgl)
source=(${_base}-releases-${pkgver}.tar.gz::${url}/archive/releases/${pkgver}.tar.gz)
sha512sums=('3367ec0059dd55d5d581daf1ac6d3ce21eaa857bda334b749ee4534fbf6ed36d3f7bcc9484e70bb3ae2e13c6bf0b8bc193ffa606688a20b79fc7d42c69c9603d')

build() {
  cd ${_base}-releases-${pkgver}/${_base}
  COIN_SKIP_PROJECTS="Sample" \
    ./configure --prefix=/usr \
    --with-osi-lib="$(pkg-config --libs osi)" \
    --with-osi-incdir="/usr/include/coin/" \
    --with-clp-lib="$(pkg-config --libs clp)" \
    --with-clp-incdir="/usr/include/coin/" \
    --with-cgl-lib="$(pkg-config --libs cgl)" \
    --with-cgl-incdir="/usr/include/coin/" \
    --with-coinutils-lib="$(pkg-config --libs coinutils)" \
    --with-coinutils-incdir="/usr/include/coin/" \
    --enable-dependency-linking \
    --enable-cbc-parallel
  make
}

# check() {
#   cd ${_base}-releases-$pkgver/${_base}
#   make test
# }

package() {
  cd ${_base}-releases-${pkgver}/${_base}
  PKG_CONFIG_LIBDIR="${pkgdir}"/usr/lib/pkgconfig/ \
    make DESTDIR="${pkgdir}" install
}
