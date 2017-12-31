# Maintainer: Baptiste Jonglez <archlinux at bitsofnetworks dot org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libsecp256k1
_gitcommit=0b7024185045a49a1a6a4c5615bf31c94f63d9c4
pkgver=20170927+825+g0b70241
pkgrel=1
pkgdesc="Optimized C library for EC operations on curve secp256k1"
arch=('x86_64')
url="https://github.com/bitcoin-core/secp256k1"
depends=("gmp")
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://github.com/bitcoin-core/secp256k1/archive/${_gitcommit}.tar.gz)
sha512sums=('54e0c446ae63105800dfaf23dc934734f196c91f275db0455e58a36926c29ecc51a13d9b1eb2e45bc86199120c3c472ec7b39086787a49ce388a4df462a870bc')

build() {
  cd "secp256k1-$_gitcommit"
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
  cd "secp256k1-$_gitcommit"
  make check
}

package() {
  cd "secp256k1-$_gitcommit"
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/libsecp256k1"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/libsecp256k1"
  make DESTDIR="$pkgdir" install
}
