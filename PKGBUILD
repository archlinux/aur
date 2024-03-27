# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Felix Golatofski <felix.golatofski@gmx.de>
# Contributor: Daniel YC Lin <dlin.tw at gmail>
_base=SYMPHONY
pkgname=coin-or-${_base,,}
pkgver=5.7.2
pkgrel=1
pkgdesc="COIN-OR solver for mixed-integer linear programs (MILPs)"
arch=(i686 x86_64)
url="https://github.com/coin-or/${_base}"
license=(EPL-2.0)
depends=(coin-or-cgl)
source=(${_base}-releases-${pkgver}.tar.gz::${url}/archive/releases/${pkgver}.tar.gz)
sha512sums=('167a8fd35d6f8fb809eeab5d986f8b3acb85d8b2094c57bfea5e060e28fd2d67e8221f779176991564bcaae79a66ed03a71aa98b61d2f89a64dc6f313ddc18fa')

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
