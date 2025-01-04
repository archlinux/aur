pkgname=('flang-classic')
pkgver=20240723
_llvmver=18.1.1-20240813
pkgrel=1
pkgdesc="out-of-tree Fortran compiler targeting LLVM"
arch=('x86_64')
url="https://github.com/flang-compiler/flang"
license=('custom:Apache 2.0 with LLVM Exception')
depends=('libxml2' 'libffi' 'libedit')
makedepends=('cmake' 'python')
options=('staticlibs' '!lto')
source=("https://github.com/flang-compiler/classic-flang-llvm-project/archive/refs/tags/flang-${_llvmver}.tar.gz"
        "https://github.com/flang-compiler/flang/archive/refs/tags/flang_${pkgver}.tar.gz")
sha256sums=('489a29f180f5394c7d5d28969326cd34e1fa1ca30f742b2b2f19dcbe7a52f519'
            '9cc25b83c4261d7ba41fc44f9ef26f046384330816d18fd28b02db86c9fa3bb8')

build() {
  # unset LIBOMP_USE_VERSION_SYMBOLS because of: /usr/bin/ld: ../../../../lib/libomp.so: version node not found for symbol omp_capture_affinity_@OMP_5.0
  cmake -S classic-flang-llvm-project-flang-${_llvmver}/llvm -B build_llvm -DCMAKE_INSTALL_PREFIX=/usr/lib/llvmcf -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_CLASSIC_FLANG=ON -DLLVM_ENABLE_PROJECTS="clang;openmp" -DLLVM_TARGETS_TO_BUILD=X86 -DLLVM_INCLUDE_BENCHMARKS=OFF -DLIBOMP_USE_VERSION_SYMBOLS=OFF -DLLVM_HOST_TRIPLE=$CHOST
  make -C build_llvm

  # for llvm-config
  export PATH=$PWD/build_llvm/bin/:$PATH

  cmake -S flang-flang_${pkgver}/runtime/libpgmath -B build_pgmath -DCMAKE_INSTALL_PREFIX=/usr/lib/llvmcf -DCMAKE_BUILD_TYPE=Release
  make -C build_pgmath

  # https://github.com/flang-compiler/flang/issues/1204
  export CFLAGS="${CFLAGS} -fpermissive"
  export CXXFLAGS="${CXXFLAGS} -Wno-error=format-security -Wp,-U_FORTIFY_SOURCE"

  cmake -S flang-flang_${pkgver} -B build -DCMAKE_INSTALL_PREFIX=/usr/lib/llvmcf -DCMAKE_BUILD_TYPE=Release -DWITH_WERROR=OFF -DCMAKE_Fortran_COMPILER=$PWD/build_llvm/bin/flang -DCMAKE_Fortran_COMPILER_ID=Flang -DLLVM_TARGETS_TO_BUILD=X86 -DLIBPGMATH=$PWD/build_pgmath/lib/libpgmath.so -DFLANG_LIBOMP=$PWD/build_llvm/lib/libomp.so -DCMAKE_INSTALL_RPATH=/usr/lib/llvmcf/lib
  make -C build
}

package() {
  make DESTDIR="${pkgdir}" install -C build_llvm
  make DESTDIR="${pkgdir}" install -C build_pgmath
  make DESTDIR="${pkgdir}" install -C build

  # Create symlinks from /usr/bin/ to /usr/lib/llvmcf/bin/
  install -d "$pkgdir"/usr/{bin,include}
  ln -s ../lib/llvmcf/bin/flang "$pkgdir/usr/bin/flang"
  for fmod in iso_fortran_env iso_c_binding ieee_arithmetic ieee_exceptions ieee_features omp_lib omp_lib_kinds
  do
    ln -s ../lib/llvmcf/include/${fmod}.mod "$pkgdir/usr/include/${fmod}.mod"
  done
}
