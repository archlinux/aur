pkgname=('flang-classic')
pkgver=20221103
llvmver=15.0.3
pkgrel=1
pkgdesc="out-of-tree Fortran compiler targeting LLVM"
arch=('x86_64')
url="https://github.com/flang-compiler/flang"
license=('custom:Apache 2.0 with LLVM Exception')
depends=('libxml2' 'libffi' 'libedit')
makedepends=('cmake' 'python')
options=('staticlibs' '!lto')
source=("https://github.com/flang-compiler/classic-flang-llvm-project/archive/refs/tags/flang-${llvmver}-${pkgver}.tar.gz"
        "https://github.com/flang-compiler/flang/archive/refs/tags/flang_${pkgver}.tar.gz")
sha256sums=(SKIP '8971e5a48fa47e2193f6b77ff2425430b14f04f4f586ba262aadd43e80ccd0f2')

prepare () {
  # include string.h for getenv & atoi
  curl -L https://github.com/llvm/llvm-project/commit/1b4fdf18.patch | patch -p1 -d classic-flang-llvm-project-flang-${llvmver}-${pkgver}
}

build() {
  # unset LIBOMP_USE_VERSION_SYMBOLS because of: /usr/bin/ld: ../../../../lib/libomp.so: version node not found for symbol omp_capture_affinity_@OMP_5.0
  cmake -S classic-flang-llvm-project-flang-${llvmver}-${pkgver}/llvm -B build_llvm -DCMAKE_INSTALL_PREFIX=/usr/lib/llvmcf -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_CLASSIC_FLANG=ON -DLLVM_ENABLE_PROJECTS="clang;openmp" -DLLVM_TARGETS_TO_BUILD=X86 -DLLVM_INCLUDE_BENCHMARKS=OFF -DLIBOMP_USE_VERSION_SYMBOLS=OFF -DLLVM_HOST_TRIPLE=$CHOST
  make -C build_llvm

  cmake -S flang-flang_${pkgver}/runtime/libpgmath -B build_pgmath -DCMAKE_INSTALL_PREFIX=/usr/lib/llvmcf -DCMAKE_BUILD_TYPE=Release
  make -C build_pgmath

  # https://github.com/flang-compiler/flang/issues/1204
  export CXXFLAGS="${CXXFLAGS} -Wno-error=format-security"

  export PATH=$PWD/build_llvm/bin/:$PATH
  cmake -S flang-flang_${pkgver} -B build -DCMAKE_INSTALL_PREFIX=/usr/lib/llvmcf -DCMAKE_BUILD_TYPE=Release -DWITH_WERROR=OFF -DCMAKE_Fortran_COMPILER=$PWD/build_llvm/bin/flang -DCMAKE_Fortran_COMPILER_ID=Flang -DLLVM_TARGETS_TO_BUILD=X86 -DLIBPGMATH=$PWD/build_pgmath/lib/libpgmath.so -DLIBOMP_EXPORT_DIR=1
  make -C build
}

package() {
  make DESTDIR="${pkgdir}" install -C build_llvm
  make DESTDIR="${pkgdir}" install -C build_pgmath
  make DESTDIR="${pkgdir}" install -C build

  # Create symlinks from /usr/bin/ to /usr/lib/llvmcf/bin/
  install -d "$pkgdir"/usr/{lib,bin,include}
  ln -s ../lib/llvmcf/bin/flang "$pkgdir/usr/bin/flang"
  ln -s ../lib/llvmcf/lib/libflang.so "$pkgdir/usr/lib/libflang.so"
  ln -s ../lib/llvmcf/lib/libflangrti.so "$pkgdir/usr/lib/libflangrti.so"
  ln -s ../lib/llvmcf/include/iso_fortran_env.mod "$pkgdir/usr/include/iso_fortran_env.mod"
  ln -s ../lib/llvmcf/include/iso_c_binding.mod "$pkgdir/usr/include/iso_c_binding.mod"
  ln -s ../lib/llvmcf/include/ieee_arithmetic.mod "$pkgdir/usr/include/ieee_arithmetic.mod"
  ln -s ../lib/llvmcf/include/ieee_exceptions.mod "$pkgdir/usr/include/ieee_exceptions.mod"
  ln -s ../lib/llvmcf/include/ieee_features.mod "$pkgdir/usr/include/ieee_features.mod"
}
