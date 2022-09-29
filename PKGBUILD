# Maintainer: Eric Biggers <ebiggers3@gmail.com>

pkgname=libdeflate-git
pkgver=1.14.r6.g03fba38
pkgrel=1
pkgdesc="Heavily optimized library for DEFLATE/zlib/gzip compression and decompression"
arch=('i686' 'x86_64')
url="https://github.com/ebiggers/libdeflate"
license=('MIT')
depends=('glibc')
makedepends=('git' 'cmake')
options=('staticlibs')
source=('git+https://github.com/ebiggers/libdeflate.git')
sha256sums=('SKIP')
conflicts=('libdeflate')
provides=('libdeflate')

pkgver() {
  cd libdeflate
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S libdeflate -DCMAKE_BUILD_TYPE=None \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  -DLIBDEFLATE_BUILD_TESTS=1 \
	  -DLIBDEFLATE_USE_SHARED_LIB=1 \
	  -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" libdeflate/{README*,NEWS*}
  install -Dm644 libdeflate/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
