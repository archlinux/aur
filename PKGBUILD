# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Felix Golatofski <felix.golatofski@gmx.de>
# Contributor: Daniel YC Lin <dlin.tw at gmail>
_base=SYMPHONY
pkgname=coin-or-${_base,,}
pkgver=5.6.19
pkgrel=1
pkgdesc="COIN-OR solver for mixed-integer linear programs (MILPs)"
arch=(i686 x86_64)
url="https://github.com/coin-or/${_base}"
license=(EPL)
depends=(coin-or-cgl)
source=(${url}/archive/releases/${pkgver}.tar.gz)
sha512sums=('56ddb754abf903aeb86bec9106f95c790feb3b9bb81bce074f7809b1789150da04fee0d9bf660a31e4047dbb41ffb63e5a8d88ee98f3acaa4e8cff4cbfe55ce8')

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
