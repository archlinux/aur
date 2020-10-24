# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Baptiste Jonglez <archlinux at bitsofnetworks dot org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libsecp256k1
_gitcommit=ac05f61fcf639a15b5101131561620303e4bd808
pkgver=20201021+1209+gac05f61
pkgrel=1
pkgdesc="Optimized C library for EC operations on curve secp256k1"
arch=(x86_64)
url="https://github.com/bitcoin-core/secp256k1"
license=(MIT)
depends=(gmp)
source=(${url}/archive/${_gitcommit}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('a5a5971f4534c0880602bcd0cf43d95ea8dcb278b5c161d55eae979fe3fb196b')

prepare() {
  cd secp256k1-${_gitcommit}
  autoreconf -vfi
}

build() {
  cd secp256k1-${_gitcommit}
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/bin \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/libsecp256k1 \
    --localstatedir=/var/lib/libsecp256k1 \
    --disable-static \
    --disable-benchmark \
    --disable-coverage \
    --enable-module-ecdh \
    --enable-module-recovery \
    --enable-tests \
    --enable-exhaustive-tests \
    --disable-openssl-tests \
    --with-gnu-ld
  make
}

check() {
  cd secp256k1-${_gitcommit}
  make check
}

package() {
  cd secp256k1-${_gitcommit}
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
