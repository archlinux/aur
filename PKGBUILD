# Maintainer: javy

pkgname=libundr
pkgver=0.8.1
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
sha512sums=('397b7aee2a001951e513cdad0baec3088b755f79044f9adcce33a2c58ccb4397e797066751c47c800e1e8aa06f5ac5b2078d8d8211faf764aff52c8dbcc95e1b')

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
