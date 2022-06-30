# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Baptiste Jonglez <archlinux at bitsofnetworks dot org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libsecp256k1
_gitcommit=43756da819a235d813e7ecd53eae6df073b53247
pkgver=20220630+1625+g43756da
pkgrel=1
pkgdesc="Optimized C library for EC operations on curve secp256k1"
arch=(x86_64)
url="https://github.com/bitcoin-core/secp256k1"
license=(MIT)
depends=(glibc)
source=(${url}/archive/${_gitcommit}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('e189c22c3e2acda8e4765ba505c3b2f683bbc9fa551672fe004c925f930ae892')

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
