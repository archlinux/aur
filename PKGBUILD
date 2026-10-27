# Maintainer: javy

pkgname=libundr
pkgver=0.8.0
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
sha512sums=('80f22bd1906b5acc2abb3f0eb10712b9d60419ae9bde4db56bba113fe0950317b0feb8f2ba4771e145ea16085dd7abd83e33e37a25fd1cf0a34fee904b40a517')

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
