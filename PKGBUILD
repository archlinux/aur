pkgname=codon
pkgver=0.15.5
pkgrel=1
pkgdesc="A high-performance, zero-overhead, extensible Python compiler using LLVM"
license=('custom')
arch=('x86_64')
url="https://github.com/exaloop/codon"
depends=('llvm-libs' 'ncurses' 'gcc-libs' 'glibc')
makedepends=('cmake' 'llvm')
source=("https://github.com/exaloop/codon/archive/refs/tags/v${pkgver}.tar.gz" llvm15.patch)
sha256sums=('f17e79800c50adf5bf58cc4d374ef4304455011454cda37d3a2d9e837677f2ae' SKIP)

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i "$srcdir"/llvm15.patch
}

build() {
  cd $pkgname-$pkgver
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/usr/python
  rm -r "$pkgdir"/usr/include/fmt
  rm "$pkgdir"/usr/include/peglib.h  
  rm "$pkgdir"/usr/lib/libfmt.a
  rm -r "$pkgdir"/usr/lib/cmake/fmt/
  rm "$pkgdir"/usr/lib/pkgconfig/fmt.pc
}

