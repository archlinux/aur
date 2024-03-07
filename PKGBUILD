pkgname=mlir
pkgver=17.0.6
pkgrel=1
pkgdesc="Multi-Level IR Compiler Framework for LLVM"
arch=('x86_64')
url="https://mlir.llvm.org/"
license=("custom:Apache 2.0 with LLVM Exception")
depends=("llvm=$pkgver")
makedepends=("cmake")
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-${pkgver}/llvm-project-${pkgver}.src.tar.xz")
sha256sums=('58a8818c60e6627064f312dbf46c02d9949956558340938b71cf731ad8bc0813')

prepare() {
  cd llvm-project-${pkgver}.src/
  # CMake Error at /usr/lib/cmake/llvm/AddLLVM.cmake:590 (add_library):
  # add_library cannot create target "llvm_gtest" because an imported target
  rm -r third-party

  # /usr/bin/ld: cannot find -lLLVMCodeGenTypes: No such file or directory
  sed -i 's|LLVM_LINK_COMPONENTS|IGNORE_THAT|g' mlir/tools/mlir-tblgen/CMakeLists.txt
}

build() {
  cmake -S llvm-project-${pkgver}.src/mlir -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLLVM_LINK_LLVM_DYLIB=ON \
    -DLLVM_BUILD_LLVM_DYLIB=ON \
    -DMLIR_LINK_MLIR_DYLIB=ON \
    -DLLVM_BUILD_TOOLS=ON \
    -DLLVM_BUILD_UTILS=ON \
    -DLLVM_ENABLE_PIC=ON
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
}
