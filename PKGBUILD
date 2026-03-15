pkgname=mlir
pkgver=22.1.1
pkgrel=1
pkgdesc="Multi-Level IR Compiler Framework for LLVM"
arch=('x86_64')
url="https://mlir.llvm.org/"
license=("Apache-2.0 WITH LLVM-exception")
depends=(llvm-libs glibc libstdc++ libgcc)
makedepends=("cmake" "llvm>=${pkgver%%.*}" lld)
options=(!lto !debug)
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/llvm-project-$pkgver.src.tar.xz{,.sig})
sha256sums=('9c6f37f6f5f68d38f435d25f770fc48c62d92b2412205767a16dac2c942f0c95'
            'SKIP')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A'  # Tom Stellard <tstellar@redhat.com>
              'D574BD5D1D0E98895E3BF90044F2485E45D59042'  # Tobias Hieta <tobias@hieta.se>
              'FFB3368980F3E6BB5737145A316C56D064CACBA5'  # Douglas Yung <douglas.yung@sony.com>
              '71046D1E9C6656BDD61171873E83BABF4A4F9E85') # Cullen Rhodes <cullen.rhodes@arm.com>

prepare() {
  cd llvm-project-${pkgver}.src/mlir
  # ld.lld: error: unable to find library -lLLVMCodeGenTypes
  sed -i "/CodeGenTypes/d" tools/mlir-tblgen/CMakeLists.txt
  # ld.lld: error: unable to find library -lLLVMSupportLSP
  sed -i "/SupportLSP/d" lib/Tools/tblgen-lsp-server/CMakeLists.txt
}

build() {
  cd llvm-project-${pkgver}.src/mlir
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLLVM_LINK_LLVM_DYLIB=ON \
    -DLLVM_BUILD_LLVM_DYLIB=ON \
    -DMLIR_LINK_MLIR_DYLIB=ON \
    -DLLVM_BUILD_TOOLS=ON \
    -DLLVM_BUILD_UTILS=ON \
    -DLLVM_ENABLE_PIC=ON \
    -DLLVM_USE_LINKER=lld \
    -B build -S .
  cmake --build build
}

package() {
  cd llvm-project-${pkgver}.src/mlir
  DESTDIR="${pkgdir}" cmake --build build --target install
}
