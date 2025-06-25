# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=('llvm19' 'llvm19-libs')
pkgver=19.1.7
pkgrel=2
arch=('x86_64')
url="https://llvm.org/"
license=('Apache-2.0 WITH LLVM-exception')
makedepends=('cmake' 'ninja' 'zlib' 'zstd' 'curl' 'libffi' 'libedit' 'libxml2'
             'python-setuptools' 'python-psutil' 'python-sphinx'
             'python-myst-parser')
options=('staticlibs' '!lto') # tools/llvm-shlib/typeids.test fails with LTO
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/llvm-$pkgver.src.tar.xz{,.sig}
        $_source_base/cmake-$pkgver.src.tar.xz{,.sig}
        $_source_base/third-party-$pkgver.src.tar.xz{,.sig})
sha256sums=('96f833c6ad99a3e8e1d9aca5f439b8fd2c7efdcf83b664e0af1c0712c5315910'
            'SKIP'
            '11c5a28f90053b0c43d0dec3d0ad579347fc277199c005206b963c19aae514e3'
            'SKIP'
            'b96deca1d3097c7ffd4ff2bb904a50bdd56bec7ed1413ffb0d1d01af87b72c12'
            'SKIP')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A'  # Tom Stellard <tstellar@redhat.com>
              'D574BD5D1D0E98895E3BF90044F2485E45D59042') # Tobias Hieta <tobias@hieta.se>

# Utilizing LLVM_DISTRIBUTION_COMPONENTS to avoid
# installing static libraries; inspired by Gentoo
_get_distribution_components() {
  local target
  ninja -t targets | grep -Po 'install-\K.*(?=-stripped:)' | while read -r target; do
    case $target in
      llvm-libraries|distribution)
        continue
        ;;
      # shared libraries
      LLVM|LLVMgold)
        ;;
      # libraries needed for clang-tblgen
      LLVMDemangle|LLVMSupport|LLVMTableGen)
        ;;
      # used by lldb
      LLVMDebuginfod)
        ;;
      # testing libraries
      LLVMTestingAnnotations|LLVMTestingSupport)
        ;;
      # exclude static libraries
      LLVM*)
        continue
        ;;
      # exclude llvm-exegesis (doesn't seem useful without libpfm)
      llvm-exegesis)
        continue
        ;;
    esac
    echo $target
  done
}

prepare() {
  rename -v -- "-$pkgver.src" '' {cmake,third-party}-$pkgver.src
  cd llvm-$pkgver.src
  mkdir build

  # Remove CMake find module for zstd; breaks if out of sync with upstream zstd
  rm cmake/modules/Findzstd.cmake
}

build() {
  cd llvm-$pkgver.src/build

  # Build only minimal debug info to reduce size
  CFLAGS=${CFLAGS/-g /-g1 }
  CXXFLAGS=${CXXFLAGS/-g /-g1 }

 local cmake_args=(
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr/lib/llvm19
    -DCMAKE_SKIP_RPATH=ON
    -DLLVM_BINUTILS_INCDIR=/usr/include
    -DLLVM_BUILD_LLVM_DYLIB=ON
    -DLLVM_BUILD_TESTS=ON
    -DLLVM_ENABLE_BINDINGS=OFF
    -DLLVM_ENABLE_CURL=ON
    -DLLVM_ENABLE_FFI=ON
    -DLLVM_ENABLE_RTTI=ON
    -DLLVM_HOST_TRIPLE=$CHOST
    -DLLVM_INCLUDE_BENCHMARKS=OFF
    -DLLVM_INSTALL_GTEST=ON
    -DLLVM_INSTALL_UTILS=ON
    -DLLVM_LINK_LLVM_DYLIB=ON
    -DLLVM_USE_PERF=ON
  )

  cmake .. "${cmake_args[@]}"
  local distribution_components=$(_get_distribution_components | paste -sd\;)
  test -n "$distribution_components"
  cmake_args+=(-DLLVM_DISTRIBUTION_COMPONENTS="$distribution_components")

  cmake .. "${cmake_args[@]}"
  ninja
}

check() {
  cd llvm-$pkgver.src/build
  LD_LIBRARY_PATH=$PWD/lib ninja check
}

package_llvm19() {
  pkgdesc="Compiler infrastructure  (LLVM 19)"
  depends=('llvm19-libs' 'curl' 'perl')

  cd llvm-$pkgver.src/build

  DESTDIR="$pkgdir" ninja install-distribution

  # The runtime libraries go into llvm19-libs
  local _llvm_lib
  for _llvm_lib in "libLLVM-${pkgver%%.*}.so" "libLLVM.so.${pkgver%.*}" LLVMgold.so; do
    mv -f "$pkgdir/usr/lib/llvm19/lib/$_llvm_lib" "$srcdir/"
  done

  # Create versioned symlinks from /usr/bin/ to /usr/lib/llvm19/bin/
  install -d "$pkgdir/usr/bin"
  local _binary
  for _binary in "$pkgdir"/usr/lib/llvm19/bin/*; do
    local _basename=${_binary##*/}
    ln -s "../lib/llvm19/bin/$_basename" "$pkgdir/usr/bin/$_basename-19"
  done

  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_llvm19-libs() {
  pkgdesc="LLVM 19 runtime libraries"
  depends=('gcc-libs' 'zlib' 'zstd' 'libffi' 'libedit' 'libxml2')

  install -d "$pkgdir/usr/lib/llvm19/lib"
  local _llvm_lib
  for _llvm_lib in "libLLVM-${pkgver%%.*}.so" "libLLVM.so.${pkgver%.*}"; do
    cp -P "$srcdir/$_llvm_lib" "$pkgdir/usr/lib/"
    ln -s "../../$_llvm_lib" "$pkgdir/usr/lib/llvm19/lib/"
  done
  cp -P "$srcdir/LLVMgold.so" "$pkgdir/usr/lib/llvm19/lib/"

  install -Dm644 "$srcdir/llvm-$pkgver.src/LICENSE.TXT" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}

# vim:set ts=2 sw=2 et:

