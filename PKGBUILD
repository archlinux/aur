pkgname=('flang')
pkgver=23.1.3
pkgrel=1
pkgdesc="ground-up implementation of a Fortran front end written in modern C++"
arch=('x86_64')
url="https://flang.llvm.org/"
license=('Apache-2.0 WITH LLVM-exception')
depends=("clang" "llvm-libs" "glibc" "libgcc" "libstdc++" "libquadmath")
makedepends=('cmake' 'python' 'llvm' "mlir>=${pkgver%%.*}")
options=(staticlibs !emptydirs !lto !debug)
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/llvm-project-$pkgver.src.tar.xz{,.sig})
sha256sums=('c44186a7762ed28954be72e5ff6df9808e0779d4f1bf014ecc4e7e211d31ee34'
            'SKIP')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A'  # Tom Stellard <tstellar@redhat.com>
              'D574BD5D1D0E98895E3BF90044F2485E45D59042'  # Tobias Hieta <tobias@hieta.se>
              'FFB3368980F3E6BB5737145A316C56D064CACBA5'  # Douglas Yung <douglas.yung@sony.com>
              '71046D1E9C6656BDD61171873E83BABF4A4F9E85') # Cullen Rhodes <cullen.rhodes@arm.com>

prepare() {
  cd "$srcdir"/llvm-project-${pkgver}.src/flang
}

build() {
  # flang standalone build
  cd "$srcdir"/llvm-project-${pkgver}.src/flang
  export CXXFLAGS="${CXXFLAGS} -Wp,-U_GLIBCXX_ASSERTIONS"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE \
    -DCLANG_DIR=/usr/lib/cmake/clang/ \
    -DMLIR_TABLEGEN_EXE=/usr/bin/mlir-tblgen \
    -DFLANG_INCLUDE_TESTS=OFF \
    -B build -S .
  cmake --build build --parallel 2

  # flang-rt standalone build
  cd "$srcdir"/llvm-project-${pkgver}.src/flang-rt
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE \
    -DCMAKE_Fortran_COMPILER="$srcdir"/llvm-project-${pkgver}.src/flang/build/bin/flang \
    -DCMAKE_Fortran_COMPILER_WORKS=yes \
    -DCMAKE_Fortran_FLAGS="" \
    -DFLANG_RT_INCLUDE_TESTS=OFF \
    -DLLVM_ENABLE_RUNTIMES="flang-rt" \
    -DLLVM_DEFAULT_TARGET_TRIPLE=$(llvm-config --host-target) \
    -B build -S "$srcdir"/llvm-project-$pkgver.src/runtimes
  cmake --build build
}

package() {
  cd "$srcdir"/llvm-project-${pkgver}.src/flang
  DESTDIR="${pkgdir}" cmake --install build
  cd "$srcdir"/llvm-project-${pkgver}.src/flang-rt
  DESTDIR="${pkgdir}" cmake --install build
}
