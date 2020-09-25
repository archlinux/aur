# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Baptiste Jonglez <archlinux at bitsofnetworks dot org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libsecp256k1
_gitcommit=d7838ba6a6ac77cec173080f20efcd0e311ebfaa
pkgver=20200919+1172+gd7838ba
pkgrel=1
pkgdesc="Optimized C library for EC operations on curve secp256k1"
arch=(x86_64)
url="https://github.com/bitcoin-core/secp256k1"
license=(MIT)
depends=(gmp)
source=(${url}/archive/${_gitcommit}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('9446f2d6d4cdf476f68b95493ae990bbec201d208cbe24b2fd14e0452acb2648')

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
