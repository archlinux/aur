pkgname=mlir
pkgver=21.1.4
pkgrel=1
pkgdesc="Multi-Level IR Compiler Framework for LLVM"
arch=('x86_64')
url="https://mlir.llvm.org/"
license=("Apache-2.0 WITH LLVM-exception")
depends=("llvm-libs")
makedepends=("cmake" "llvm>=${pkgver%%.*}")
options=(!lto)
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/mlir-$pkgver.src.tar.xz{,.sig}
        $_source_base/cmake-$pkgver.src.tar.xz{,.sig})
sha256sums=('d3d418a24b14c11c6ec7d57d9317932f7a6be51ff9b1ea977e8943b980426030'
            'SKIP'
            'f4316d84a862ba3023ca1d26bd9c6a995516b4fa028b6fb329d22e24cc6d235e'
            'SKIP')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A'  # Tom Stellard <tstellar@redhat.com>
              'D574BD5D1D0E98895E3BF90044F2485E45D59042'  # Tobias Hieta <tobias@hieta.se>
              'FFB3368980F3E6BB5737145A316C56D064CACBA5'  # Douglas Yung <douglas.yung@sony.com>
              '71046D1E9C6656BDD61171873E83BABF4A4F9E85') # Cullen Rhodes <cullen.rhodes@arm.com>

prepare() {
  cd mlir-${pkgver}.src/
  # /usr/bin/ld: cannot find -lLLVMCodeGenTypes: No such file or directory
  sed -i 's|LLVM_LINK_COMPONENTS|IGNORE_THAT|g' tools/mlir-tblgen/CMakeLists.txt
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
