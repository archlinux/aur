pkgname=codon
pkgver=0.17.0
pkgrel=1
pkgdesc="A high-performance, zero-overhead, extensible Python compiler using LLVM"
license=('custom')
arch=('x86_64')
url="https://github.com/exaloop/codon"
depends=('llvm17-libs' 'ncurses' 'gcc-libs' 'glibc')
makedepends=('cmake' 'llvm17')
source=("https://github.com/exaloop/codon/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1e4a56c139adc63584a1de0a4141b9174b9f0d0d764ebe81d164e12fa275b7e0')

prepare() {
  cd $pkgname-$pkgver
  # link to the single lib
  sed -i "s|\${LLVM_LIBS}|LLVM-17|g" CMakeLists.txt

  # undefined reference to symbol '_ZN4llvm27createRegionOnlyPrinterPassEv@@LLVM_17'
  echo "target_link_libraries(codon PRIVATE LLVM-17)" >> CMakeLists.txt
  echo "target_link_libraries(codon_test LLVM-17)" >> CMakeLists.txt
}

build() {
  cd $pkgname-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCPM_USE_LOCAL_PACKAGES=OFF -DLIBOMP_USE_VERSION_SYMBOLS=OFF -DLLVM_DIR=/usr/lib/llvm17/lib/cmake/llvm -B build .
  make -C build
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

