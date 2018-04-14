# Maintainer: Eric Biggers <ebiggers3@gmail.com>

pkgname=libdeflate-git
pkgver=1.0.r0.g9a327aa
pkgrel=1
pkgdesc="Heavily optimized library for DEFLATE/zlib/gzip compression and decompression"
arch=('i686' 'x86_64')
url="https://github.com/ebiggers/libdeflate"
license=('MIT')
depends=('glibc')
options=('staticlibs')
source=('git+https://github.com/ebiggers/libdeflate.git')
sha256sums=('SKIP')
conflicts=('libdeflate')
provides=('libdeflate')
replaces=('libdeflate')

pkgver() {
  cd libdeflate
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd libdeflate
  make
}

check() {
  cd libdeflate

  make test_programs
  ./test_checksums
}

package() {
  cd libdeflate

  install -Dm755 "gzip" "$pkgdir/usr/bin/libdeflate-gzip"
  ln "$pkgdir/usr/bin/libdeflate-gzip" "$pkgdir/usr/bin/libdeflate-gunzip"

  install -Dm755 "libdeflate.so" "$pkgdir/usr/lib/libdeflate.so"
  install -Dm644 "libdeflate.h" "$pkgdir/usr/include/libdeflate.h"
  install -Dm644 "libdeflate.a" "$pkgdir/usr/lib/libdeflate.a"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README* NEWS
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
