# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Baptiste Jonglez <archlinux at bitsofnetworks dot org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libsecp256k1
_gitcommit=e729cc7f5a76cb20cbe2317e8e8dad3e422740a0
pkgver=20190822+995+ge729cc7
pkgrel=1
pkgdesc="Optimized C library for EC operations on curve secp256k1"
arch=(x86_64)
url="https://github.com/bitcoin-core/secp256k1"
license=(MIT)
depends=(gmp)
source=(${url}/archive/${_gitcommit}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('e3f74cc97b425904c3bd13ab363f0d7e19db8bca1671d2b2363a9baf550583e93f4f7c12abf35029ea363342796e0f0c54256e02aca0446181ede8a9fde0be64')

build() {
  cd secp256k1-${_gitcommit}
  ./autogen.sh
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
    --disable-jni \
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
