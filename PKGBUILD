# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=clang15
pkgver=15.0.7
pkgrel=2
pkgdesc="C language family frontend for LLVM 15"
arch=('x86_64')
url="https://clang.llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
depends=('llvm15-libs' 'gcc' 'compiler-rt15')
makedepends=('llvm15' 'cmake' 'ninja' 'python')
optdepends=('openmp: OpenMP support in clang with -fopenmp'
            'llvm15: referenced by some clang headers')
checkdepends=('llvm')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/clang-$pkgver.src.tar.xz{,.sig}
        $_source_base/llvm-$pkgver.src.tar.xz{,.sig}
        $_source_base/cmake-$pkgver.src.tar.xz{,.sig}
        $pkgname-linker-wrapper-tool-r1.patch::https://github.com/llvm/llvm-project/commit/c2aabcfc8395.patch
        lit16.patch
        enable-fstack-protector-strong-by-default.patch)
sha256sums=('a6b673ef15377fb46062d164e8ddc4d05c348ff8968f015f7f4af03f51000067'
            'SKIP'
            '4ad8b2cc8003c86d0078d15d987d84e3a739f24aae9033865c027abae93ee7a4'
            'SKIP'
            '8986f29b634fdaa9862eedda78513969fe9788301c9f2d938f4c10a3e7a3e7ea'
            'SKIP'
            '75f220b68622a57b49a9480fe2ee321c7ff9b5ce643091b6cb510b9e38400e92'
            '8c8e1a01d3a46b20a78eccec29904edca46caa2c15fb4e8998423098b482e1a2'
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
  mv cmake{-$pkgver.src,}
  cd clang-$pkgver.src
  mkdir build
  patch -Np2 -i ../enable-fstack-protector-strong-by-default.patch

  # https://reviews.llvm.org/D145862
  patch -Np2 -l -i ../$pkgname-linker-wrapper-tool-r1.patch

  # Fix testing with lit from LLVM 16
  patch -Np2 -i ../lit16.patch

  # Remove a couple of failing tests
  rm test/Driver/XRay/xray-instrument-{cpu,os}.c
}

build() {
  cd clang-$pkgver.src/build

  # Build only minimal debug info to reduce size
  CFLAGS=${CFLAGS/-g /-g1 }
  CXXFLAGS=${CXXFLAGS/-g /-g1 }

  local cmake_args=(
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr/lib/llvm15
    -DCMAKE_SKIP_RPATH=ON
    -DCLANG_DEFAULT_PIE_ON_LINUX=ON
    -DCLANG_LINK_CLANG_DYLIB=ON
    -DENABLE_LINKER_BUILD_ID=ON
    -DLLVM_BUILD_TESTS=ON
    -DLLVM_CONFIG=/usr/lib/llvm15/bin/llvm-config
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

  mv "$pkgdir"/usr/lib/{llvm15/lib/,}libclang-cpp.so.15
  ln -s ../../libclang-cpp.so.15 "$pkgdir/usr/lib/llvm15/lib/libclang-cpp.so.15"
  ln -s llvm15/lib/libclang.so.15 "$pkgdir"/usr/lib/libclang.so.15
}

# vim:set ts=2 sw=2 et:
