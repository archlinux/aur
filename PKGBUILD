# Maintainer: javy

pkgname=libepub
pkgver=0.1.1
pkgrel=1
pkgdesc="C library for creating EPUB files"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/javy/libepub"
license=('MIT')
depends=('util-linux-libs' 'undr')
makedepends=('git' 'gcc' 'make')
provides=('libepub')
conflicts=('libepub')
source=("$pkgname::git+$url.git#tag=$pkgver")
sha512sums=('47562e711fa2a4b702cb4945e205ba087c7ef66aacc54ac64df59ff5390c79d7d566c977672368fc6d65f01473d39caf86310a201fceb8b3b879c130231d9d2f')

build() {
  cd "${pkgname}"
  make CFLAGS="-Wall -Wextra -g -std=c23 -pedantic -Iinclude -fPIC" \
       LD_FLAGS="-luuid -lundr" \
       libepub.so
}

package() {
  cd "${pkgname}"
  
  install -d "${pkgdir}/usr/include"
  install -d "${pkgdir}/usr/lib"

  install -m644 epub.h "${pkgdir}/usr/include/"

  install -m755 libepub.so "${pkgdir}/usr/lib/libepub.so.${pkgver}"
  ln -s "libepub.so.${pkgver}" "${pkgdir}/usr/lib/libepub.so"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
