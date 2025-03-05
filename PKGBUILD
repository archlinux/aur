# Maintainer: Stefan Wimmer <info@stefanwimmer128.xyz>
# Contributor: Lancelot Owczarczak <lancelot@owczarczak.fr>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: An Nguyen <an-1258@outlook.com>

pkgname=clang17
pkgver=17.0.6
pkgrel=3
pkgdesc="C language family frontend for LLVM 17"
arch=('x86_64')
url="https://clang.llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
depends=('llvm17-libs' 'gcc' 'compiler-rt17')
makedepends=('llvm17' 'llvm' 'cmake' 'ninja' 'python' 'python-recommonmark' 'python-fissix')
optdepends=('openmp: OpenMP support in clang with -fopenmp'
            'llvm17: referenced by some clang headers')
checkdepends=('llvm')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/clang-$pkgver.src.tar.xz
        $_source_base/clang-tools-extra-$pkgver.src.tar.xz
        $_source_base/llvm-$pkgver.src.tar.xz
        $_source_base/cmake-$pkgver.src.tar.xz
        $_source_base/third-party-$pkgver.src.tar.xz
        clangd-handle-missing-ending-brace.patch
        enable-fstack-protector-strong-by-default.patch)
sha256sums=('a78f668a726ae1d3d9a7179996d97b12b90fb76ab9442a43110b972ff7ad9029'
            'aa774642415d338d7b77a66fcbad6fd1f77f382dabcb67422a6230614eff1ab9'
            'b638167da139126ca11917b6880207cc6e8f9d1cbb1a48d87d017f697ef78188'
            '807f069c54dc20cb47b21c1f6acafdd9c649f3ae015609040d6182cab01140f4'
            '3054d0a9c9375dab1a4539cc2cc45ab340341c5d71475f9599ba7752e222947b'
            'c102e8a6a2adb0e8729865ffb8799b22bb8a9bdf0f421991880fa4393378370a'
            '45da5783f4e89e4507a351ed0ffbbe6ec240e21ff7070797a89c5ccf434ac612')

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
      bash-autocomplete|clang-format|clang-rename|hmaptool|scan-*|clang-tidy-headers)
        continue
        ;;
      clang|clangd|clang-*)
        ;;
      clang*|findAllSymbols)
        continue
        ;;
    esac
    echo $target
  done
}

prepare() {
  rename -v -- "-$pkgver.src" '' {cmake,third-party}-$pkgver.src
  cd clang-$pkgver.src
  mkdir build
  mv "$srcdir/clang-tools-extra-$pkgver.src" tools/extra

  patch -Np2 -i ../enable-fstack-protector-strong-by-default.patch

  # https://github.com/clangd/clangd/issues/1559
  sed 's|clang-tools-extra|clang/tools/extra|' \
    clangd-handle-missing-ending-brace.patch | patch -Np2

  # Attempt to convert script to Python 3
  python -m fissix -wn --no-diffs \
    tools/extra/clang-include-fixer/find-all-symbols/tool/run-find-all-symbols.py
}

build() {
  cd clang-$pkgver.src/build

  # Build only minimal debug info to reduce size
  CFLAGS=${CFLAGS/-g /-g1 }
  CXXFLAGS=${CXXFLAGS/-g /-g1 }

  local cmake_args=(
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr/lib/llvm17
    -DCMAKE_PREFIX_PATH=/usr/lib/llvm17
    -DCMAKE_INSTALL_DOCDIR=share/doc
    -DCMAKE_SKIP_RPATH=ON
    -DCLANG_DEFAULT_PIE_ON_LINUX=ON
    -DCLANG_LINK_CLANG_DYLIB=ON
    -DENABLE_LINKER_BUILD_ID=ON
    -DLLVM_BUILD_DOCS=ON
    -DLLVM_BUILD_TESTS=ON
    -DLLVM_CONFIG=/usr/lib/llvm17/bin/llvm-config
    -DLLVM_ENABLE_RTTI=ON
    -DLLVM_ENABLE_SPHINX=ON
    -DLLVM_EXTERNAL_LIT=/usr/bin/lit
    -DLLVM_INCLUDE_DOCS=ON
    -DLLVM_LINK_LLVM_DYLIB=ON
    -DLLVM_MAIN_SRC_DIR="$srcdir/llvm-$pkgver.src"
    -DSPHINX_WARNINGS_AS_ERRORS=OFF
    -DLLVM_INCLUDE_TESTS=OFF
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
  LD_LIBRARY_PATH=$PWD/lib ninja clang-check
}

package() {
  cd clang-$pkgver.src/build

  DESTDIR="$pkgdir" ninja install-distribution
  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  mv "$pkgdir"/usr/lib/{llvm17/lib/,}libclang-cpp.so.17
  ln -s ../../libclang-cpp.so.17 "$pkgdir/usr/lib/llvm17/lib/libclang-cpp.so.17"
  ln -s llvm17/lib/libclang.so.17 "$pkgdir"/usr/lib/libclang.so.17

  install -d "$pkgdir/usr/bin"
  local _binary
  for _binary in "$pkgdir"/usr/lib/llvm17/bin/*; do
    local _basename=${_binary##*/}
    ln -s ../lib/llvm17/bin/$_basename "$pkgdir/usr/bin/$_basename-17"
  done
}

# vim:set ts=2 sw=2 et:
