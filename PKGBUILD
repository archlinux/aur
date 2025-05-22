pkgname=mlir
pkgver=19.1.7
pkgrel=1
pkgdesc="Multi-Level IR Compiler Framework for LLVM"
arch=('x86_64')
url="https://mlir.llvm.org/"
license=("custom:Apache 2.0 with LLVM Exception")
depends=("llvm-libs")
makedepends=("cmake" "llvm>=${pkgver%%.*}")
options=(!lto)
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/mlir-$pkgver.src.tar.xz{,.sig}
        $_source_base/cmake-$pkgver.src.tar.xz{,.sig})
sha256sums=('4e1ea9ed9a60589466ad89d4b739f12a3a51fb828caaebc3bfc59172c6ce0eee'
            'SKIP'
            '11c5a28f90053b0c43d0dec3d0ad579347fc277199c005206b963c19aae514e3'
            'SKIP')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A'  # Tom Stellard <tstellar@redhat.com>
              'D574BD5D1D0E98895E3BF90044F2485E45D59042') # Tobias Hieta <tobias@hieta.se>

prepare() {
  cd mlir-${pkgver}.src/
  # /usr/bin/ld: cannot find -lLLVMCodeGenTypes: No such file or directory
  sed -i 's|LLVM_LINK_COMPONENTS|IGNORE_THAT|g' tools/mlir-tblgen/CMakeLists.txt

  # FuncOps.h.inc: No such file or directory
  curl -L https://github.com/llvm/llvm-project/pull/97885.patch | patch -p2

  #include <cstdint> for gcc 15
  curl -L https://github.com/llvm/llvm-project/pull/110932.patch | patch -p2 -f || :
  curl -L https://github.com/llvm/llvm-project/commit/101109f.patch | patch -p2
  curl -L https://github.com/llvm/llvm-project/commit/a6bb8a7.patch | patch -p2
}

build() {
  cp -r cmake{-$pkgver.src,}
  cd mlir-${pkgver}.src
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLLVM_LINK_LLVM_DYLIB=ON \
    -DLLVM_BUILD_LLVM_DYLIB=ON \
    -DMLIR_LINK_MLIR_DYLIB=ON \
    -DLLVM_BUILD_TOOLS=ON \
    -DLLVM_BUILD_UTILS=ON \
    -DLLVM_ENABLE_PIC=ON \
    -B build -S .
  cmake --build build
}

package() {
  cd mlir-${pkgver}.src
  DESTDIR="${pkgdir}" cmake --build build --target install
}
