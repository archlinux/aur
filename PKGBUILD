pkgname=('flang')
pkgver=20.1.6
pkgrel=1
pkgdesc="ground-up implementation of a Fortran front end written in modern C++"
arch=('x86_64')
url="http://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
depends=("mlir>=${pkgver%%.*}")
makedepends=('cmake' 'python' 'clang' 'llvm')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/flang-$pkgver.src.tar.xz{,.sig}
        $_source_base/cmake-$pkgver.src.tar.xz{,.sig}
        $_source_base/clang-$pkgver.src.tar.xz{,.sig})
sha256sums=('fc3e745ca0d72a339abc67982c6cef365ab452435e06cb7ad519d502a112cd54'
            'SKIP'
            'b4b3efa5d5b01b3f211f1ba326bb6f0c318331f828202d332c95b7f30fca5f8c'
            'SKIP'
            '49a16d6b6878a6bdd9ead2d31ffb94c792675607471afa40096fbd48b3cbab66'
            'SKIP')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A'  # Tom Stellard <tstellar@redhat.com>
              'D574BD5D1D0E98895E3BF90044F2485E45D59042') # Tobias Hieta <tobias@hieta.se>

prepare() {
  cd flang-$pkgver.src
}

build() {
  cp -r clang{-$pkgver.src,}
  cp -r cmake{-$pkgver.src,}
  cd flang-$pkgver.src
  export CXXFLAGS="${CXXFLAGS} -Wp,-U_GLIBCXX_ASSERTIONS"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCLANG_DIR=/usr/lib/cmake/clang/ \
    -DMLIR_TABLEGEN_EXE=/usr/bin/mlir-tblgen \
    -DFLANG_INCLUDE_TESTS=OFF \
    -B build -S .
  make -C build
}

package() {
  cd flang-$pkgver.src
  make DESTDIR="${pkgdir}" install -C build
}
