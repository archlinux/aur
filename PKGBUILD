# Maintainer: caskstrength

pkgname=libundr
pkgver=0.7.0
pkgrel=1
pkgdesc="C library with multiple utilities"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/caskstrength/libundr"
license=('MIT')
depends=('glibc' 'openssl' 'curl')
makedepends=('git' 'gcc' 'make')
provides=('undr')
conflicts=('undr')
source=("$pkgname::git+$url.git#tag=$pkgver")
sha512sums=('c0676c908e990fab7f3b9f2227a745511b1274c1a2ba6c09b569f16f3beb0b8c1082000b7cc5e1b3c85b47f0db28efaa70d7a01fa19e2664d59f0d6cd89c19b1')

build() {
  cd "${pkgname}"
  make CFLAGS="-Wall -Wextra -g -std=c23 -pedantic -Iinclude -fPIC -lcrypto -lcurl" libundr.so
}

package() {
  cd "${pkgname}"
  
  install -d "${pkgdir}/usr/include/undr"
  install -d "${pkgdir}/usr/lib"

  install -m644 include/undr/*.h "${pkgdir}/usr/include/undr/"

  install -m755 libundr.so "${pkgdir}/usr/lib/libundr.so.${pkgver}"
  ln -s "libundr.so.${pkgver}" "${pkgdir}/usr/lib/libundr.so"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
