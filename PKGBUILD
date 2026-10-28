# Maintainer: javy

pkgname=libepub
pkgver=0.3.0
pkgrel=1
pkgdesc="C library for creating EPUB files"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/javy/libepub"
license=('MIT')
depends=('util-linux-libs' 'undr' 'libzip')
makedepends=('git' 'gcc' 'make')
provides=('libepub')
conflicts=('libepub')
source=("$pkgname::git+$url.git#tag=$pkgver")
sha512sums=('72a6011d5e072135239ce47ca1f44f0a6926f074b0e91b76df367703f29f65499dea98a51e280a6750a5edff41ee1a50a7053e0dcf146d252c7d27f6f6ce56d2')

build() {
  cd "${pkgname}"
  make CFLAGS="-Wall -Wextra -g -std=c23 -pedantic -Iinclude -fPIC" \
       LD_FLAGS="-luuid -lundr -lzip" \
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
