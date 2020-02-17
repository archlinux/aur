# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Baptiste Jonglez <archlinux at bitsofnetworks dot org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libsecp256k1
_gitcommit=856a01d6ad60c70fd92bdd44fa8584493b87594d
pkgver=20200210+1037+g856a01d
pkgrel=1
pkgdesc="Optimized C library for EC operations on curve secp256k1"
arch=(x86_64)
url="https://github.com/bitcoin-core/secp256k1"
license=(MIT)
depends=(gmp)
source=(${url}/archive/${_gitcommit}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('5ba3ef13f849fa79d9493e580a3dc7f08b27d1e0e6080913063955ea9f88aec1')

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
