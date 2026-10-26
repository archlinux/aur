# Maintainer: javy

pkgname=libepub
pkgver=0.2.0
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
sha512sums=('c408c2b48913e4b29fe7f72ab3e35ca36afac5fd406ec0f14f1d6bf4b0b07e1a1ee32f43bb4810edd6de8a16facd401d23aa2732af86ae085f8f73d40cb7eaf3')

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
