pkgname=('flang')
pkgver=17.0.6
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
sha256sums=('ca3bececb1ca31b993cdf837d2305e4c9af3b6c7acc93d8a2813cb6619d7640b'
            'SKIP'
            '807f069c54dc20cb47b21c1f6acafdd9c649f3ae015609040d6182cab01140f4'
            'SKIP'
            'a78f668a726ae1d3d9a7179996d97b12b90fb76ab9442a43110b972ff7ad9029'
            'SKIP')

prepare() {
  # https://github.com/llvm/llvm-project/issues/54128
  curl -L https://github.com/llvm/llvm-project/pull/71691.patch | patch -p2 -d flang-$pkgver.src
}

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
