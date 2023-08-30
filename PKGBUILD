pkgname=('flang')
pkgver=16.0.6
pkgrel=1
pkgdesc="ground-up implementation of a Fortran front end written in modern C++"
arch=('x86_64')
url="http://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
depends=("mlir>=${pkgver%%.*}")
makedepends=('cmake' 'python' 'clang')
validpgpkeys+=('B6C8F98282B944E3B0D5C2530FC3042E345AD05D') # Hans Wennborg <hans@chromium.org>
validpgpkeys+=('474E22316ABF4785A88C6E8EA2C794A986419D8A') # Tom Stellard <tstellar@redhat.com>
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/flang-$pkgver.src.tar.xz{,.sig}
        $_source_base/cmake-$pkgver.src.tar.xz{,.sig}
        $_source_base/clang-$pkgver.src.tar.xz{,.sig})
sha256sums=('0a15d253d0d81c6f4619cd834f7a934e6ae69cfc74eeed9ba3c8372648253017'
            'SKIP'
            '39d342a4161095d2f28fb1253e4585978ac50521117da666e2b1f6f28b62f514'
            'SKIP'
            '1186b6e6eefeadd09912ed73b3729e85b59f043724bb2818a95a2ec024571840'
            'SKIP')

build() {
  rm -rf clang cmake
  mv clang{-$pkgver.src,}
  mv cmake{-$pkgver.src,}
  export CXXFLAGS="${CXXFLAGS} -Wp,-U_GLIBCXX_ASSERTIONS"
  cmake -S flang-$pkgver.src -B build -DCMAKE_INSTALL_PREFIX=/usr \
    -DCLANG_DIR=/usr/lib/cmake/clang/ -DMLIR_TABLEGEN_EXE=/usr/bin/mlir-tblgen -DFLANG_INCLUDE_TESTS=OFF
  make -C build
}

package() {
  make DESTDIR="${pkgdir}" install -C build
}
