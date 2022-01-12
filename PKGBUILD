# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Felix Golatofski <felix.golatofski@gmx.de>
# Contributor: Daniel YC Lin <dlin.tw at gmail>
_base=SYMPHONY
pkgname=coin-or-${_base,,}
pkgver=5.6.17
pkgrel=2
pkgdesc="COIN-OR solver for mixed-integer linear programs (MILPs)"
arch=(i686 x86_64)
url="https://github.com/coin-or/${_base}"
license=(EPL)
depends=(coin-or-cgl)
source=(${url}/archive/releases/${pkgver}.tar.gz)
sha512sums=('eb0022184b1d0325729bb8f5390093ff1cfdfc87edf1dfdf20e62f07830c69604ec373b69c6de13755611a8e96f79ee8d1009efde0a35c9e7c0fab6652375ff7')

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
