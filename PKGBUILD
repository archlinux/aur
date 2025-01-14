pkgname=('flang')
pkgver=19.1.6
pkgrel=1
pkgdesc="ground-up implementation of a Fortran front end written in modern C++"
arch=('x86_64')
url="http://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
depends=("mlir>=${pkgver%%.*}")
makedepends=('cmake' 'python' 'clang')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/flang-$pkgver.src.tar.xz{,.sig}
        $_source_base/cmake-$pkgver.src.tar.xz{,.sig}
        $_source_base/clang-$pkgver.src.tar.xz{,.sig})
sha256sums=('789c41b0c8413c9ed0c2292308a1a053284368435d517282a81290c7c554d517'
            'SKIP'
            '9c7ec82d9a240dc2287b8de89d6881bb64ceea0dcd6ce133c34ef65bda22d99e'
            'SKIP'
            '6358cbb3e14687ca2f3465c61cffc65589b448aaa912ec2c163ef9fc046e8a89'
            'SKIP')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A'  # Tom Stellard <tstellar@redhat.com>
              'D574BD5D1D0E98895E3BF90044F2485E45D59042') # Tobias Hieta <tobias@hieta.se>

prepare() {
  cd flang-$pkgver.src
  # Fix finding system install of LLVM/Clang/MLIR in standalone builds
  curl -L https://github.com/llvm/llvm-project/pull/120914.patch | patch -p2
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
