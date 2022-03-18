# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Baptiste Jonglez <archlinux at bitsofnetworks dot org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libsecp256k1
_gitcommit=e0508ee9db2725c5efbc1cad434e14c2ebf55427
pkgver=20220317+1581+ge0508ee
pkgrel=1
pkgdesc="Optimized C library for EC operations on curve secp256k1"
arch=(x86_64)
url="https://github.com/bitcoin-core/secp256k1"
license=(MIT)
depends=(glibc)
source=(${url}/archive/${_gitcommit}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('0b950fb4d1ff56c514c343b183bfac285faaa751bc1e286e54ad0b7c9d76595f')

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
