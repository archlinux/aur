pkgname=('flang')
pkgver=15.0.7
pkgrel=1
pkgdesc="ground-up implementation of a Fortran front end written in modern C++"
arch=('x86_64')
url="http://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
depends=('llvm' 'mlir')
makedepends=('cmake' "llvm>=${pkgver%%.*}" 'python')
validpgpkeys+=('B6C8F98282B944E3B0D5C2530FC3042E345AD05D') # Hans Wennborg <hans@chromium.org>
validpgpkeys+=('474E22316ABF4785A88C6E8EA2C794A986419D8A') # Tom Stellard <tstellar@redhat.com>
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/flang-$pkgver.src.tar.xz{,.sig}
        $_source_base/cmake-$pkgver.src.tar.xz{,.sig}
        $_source_base/clang-$pkgver.src.tar.xz{,.sig})
sha256sums=('eb217f0efab3aacb4f1777e43ef5ed2186d4a03a6140613623b3ac764e934860'
            'SKIP' SKIP SKIP SKIP SKIP)

prepare () {
  cd flang-$pkgver.src
  sed -i "s|clangBasic|libclang|g" lib/Frontend/CMakeLists.txt lib/FrontendTool/CMakeLists.txt
  sed -i "16i#include <cstdint>" include/flang/Parser/characters.h
  sed -i "s|LLVMPasses|LLVM|g" tools/*/CMakeLists.txt
  sed -i "s|clangDriver|libclang|g" lib/Frontend/CMakeLists.txt lib/FrontendTool/CMakeLists.txt tools/flang-driver/CMakeLists.txt
}

build() {
  mv clang{-$pkgver.src,}
  mv cmake{-$pkgver.src,}
  export CXXFLAGS="${CXXFLAGS} -Wp,-U_GLIBCXX_ASSERTIONS"
  cmake -S flang-$pkgver.src -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DClang_DIR=/usr/lib/cmake/clang/ -DCLANG_DIR=/usr/lib/cmake/clang/ -DMLIR_TABLEGEN_EXE=/usr/bin/mlir-tblgen
  make -C build
}

package() {
  make DESTDIR="${pkgdir}" install -C build
}
