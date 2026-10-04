# Maintainer: javy

pkgname=libundr
pkgver=0.7.1
pkgrel=1
pkgdesc="C library with multiple utilities"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/javy/libundr"
license=('MIT')
depends=('glibc' 'openssl' 'curl')
makedepends=('git' 'gcc' 'make')
provides=('undr')
conflicts=('undr')
source=("$pkgname::git+$url.git#tag=$pkgver")
sha512sums=('88b2bcb53ef8daa899c2e7ed8dd064fea8ad8312e0535ecfa211e3d8e4f298a00d77c888c233d3cbd36c417c265828ccf2017c80d6c21df08048cccdeb7c8184')

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
