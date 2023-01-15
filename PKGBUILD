# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=clang14
pkgver=14.0.6
pkgrel=1
pkgdesc="C language family frontend for LLVM 14"
arch=('x86_64')
url="https://clang.llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
depends=('llvm14-libs' 'gcc' 'compiler-rt14')
makedepends=('llvm14' 'cmake' 'ninja' 'python')
optdepends=('openmp: OpenMP support in clang with -fopenmp'
            'llvm14: referenced by some clang headers')
checkdepends=('llvm')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/clang-$pkgver.src.tar.xz{,.sig}
        $_source_base/llvm-$pkgver.src.tar.xz{,.sig}
        enforce-instantiation-of-constexpr-template-functions.patch
        clang-coroutines-ubsan.patch
        enable-fstack-protector-strong-by-default.patch)
sha256sums=('2b5847b6a63118b9efe5c85548363c81ffe096b66c3b3675e953e26342ae4031'
            'SKIP'
            '050922ecaaca5781fdf6631ea92bc715183f202f9d2f15147226f023414f619a'
            'SKIP'
            'eb2916131ae63b3bd1689f6a27dc0c2fadad73a5c5f2c828062c8a2c547e4a0d'
            '2c25ddf0ba6be01949842873fef4d285456321aaccd4ba95db61b69a4c580106'
            '7a9ce949579a3b02d4b91b6835c4fb45adc5f743007572fb0e28e6433e48f3a5')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A') # Tom Stellard <tstellar@redhat.com>

# Utilizing LLVM_DISTRIBUTION_COMPONENTS to avoid
# installing static libraries; inspired by Gentoo
_get_distribution_components() {
  local target
  ninja -t targets | grep -Po 'install-\K.*(?=-stripped:)' | while read -r target; do
    case $target in
      clang-libraries|distribution)
        continue
        ;;
      # trim static analyzer and other bits
      bash-autocomplete|clang-format|clang-rename|hmaptool|scan-*)
        continue
        ;;
      clang|clang-*)
        ;;
      clang*|findAllSymbols)
        continue
        ;;
    esac
    echo $target
  done
}

prepare() {
  cd clang-$pkgver.src
  mkdir build
  patch -Np2 -i ../enable-fstack-protector-strong-by-default.patch

  # https://github.com/llvm/llvm-project/issues/55560
  patch -Np2 -i ../enforce-instantiation-of-constexpr-template-functions.patch

  # https://github.com/llvm/llvm-project/issues/49689
  patch -Np2 -i ../clang-coroutines-ubsan.patch
}

build() {
  cd clang-$pkgver.src/build

  # Build only minimal debug info to reduce size
  CFLAGS=${CFLAGS/-g /-g1 }
  CXXFLAGS=${CXXFLAGS/-g /-g1 }

  local cmake_args=(
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr/lib/llvm14
    -DCMAKE_SKIP_RPATH=ON
    -DCLANG_DEFAULT_PIE_ON_LINUX=ON
    -DCLANG_LINK_CLANG_DYLIB=ON
    -DENABLE_LINKER_BUILD_ID=ON
    -DLLVM_BUILD_TESTS=ON
    -DLLVM_CONFIG=/usr/lib/llvm14/bin/llvm-config
    -DLLVM_ENABLE_RTTI=ON
    -DLLVM_EXTERNAL_LIT=/usr/bin/lit
    -DLLVM_LINK_LLVM_DYLIB=ON
    -DLLVM_MAIN_SRC_DIR="$srcdir/llvm-$pkgver.src"
  )

  cmake .. "${cmake_args[@]}"
  local distribution_components=$(_get_distribution_components | paste -sd\;)
  test -n "$distribution_components"
  cmake_args+=(-DLLVM_DISTRIBUTION_COMPONENTS="$distribution_components")

  cmake .. "${cmake_args[@]}"
  ninja
}

check() {
  cd clang-$pkgver.src/build
  LD_LIBRARY_PATH=$PWD/lib ninja check-clang
}

package() {
  cd clang-$pkgver.src/build

  DESTDIR="$pkgdir" ninja install-distribution
  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  mv "$pkgdir"/usr/lib/{llvm14/lib/,}libclang-cpp.so.14
  ln -s ../../libclang-cpp.so.14 "$pkgdir/usr/lib/llvm14/lib/libclang-cpp.so.14"
  ln -s llvm14/lib/libclang.so.13 "$pkgdir"/usr/lib/libclang.so.13
}

# vim:set ts=2 sw=2 et:
