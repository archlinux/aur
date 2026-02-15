pkgname=mlir
pkgver=21.1.8
pkgrel=1
pkgdesc="Multi-Level IR Compiler Framework for LLVM"
arch=('x86_64')
url="https://mlir.llvm.org/"
license=("Apache-2.0 WITH LLVM-exception")
depends=("llvm-libs")
makedepends=("cmake" "llvm>=${pkgver%%.*}" lld)
options=(!lto !debug)
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/mlir-$pkgver.src.tar.xz{,.sig}
        $_source_base/cmake-$pkgver.src.tar.xz{,.sig})
sha256sums=('b4cc53d5ca6b72d654b22e18e8997a73c1cec93077b52725ed29cf7d535b1ddb'
            'SKIP'
            '85735f20fd8c81ecb0a09abb0c267018475420e93b65050cc5b7634eab744de9'
            'SKIP')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A'  # Tom Stellard <tstellar@redhat.com>
              'D574BD5D1D0E98895E3BF90044F2485E45D59042'  # Tobias Hieta <tobias@hieta.se>
              'FFB3368980F3E6BB5737145A316C56D064CACBA5'  # Douglas Yung <douglas.yung@sony.com>
              '71046D1E9C6656BDD61171873E83BABF4A4F9E85') # Cullen Rhodes <cullen.rhodes@arm.com>

prepare() {
  cd mlir-${pkgver}.src/
  # /usr/bin/ld: cannot find -lLLVMCodeGenTypes: No such file or directory
  sed -i 's|LLVM_LINK_COMPONENTS|IGNORE_THAT|g' tools/mlir-tblgen/CMakeLists.txt

  # https://github.com/llvm/llvm-project/issues/160896
  sed -i '14iMLIRVectorTransformsIncGen' lib/Dialect/Vector/IR/CMakeLists.txt
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
    -DLLVM_USE_LINKER=lld \
    -B build -S .
  cmake --build build
}

package() {
  cd mlir-${pkgver}.src
  DESTDIR="${pkgdir}" cmake --build build --target install
}
