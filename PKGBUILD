# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=clang13
pkgver=13.0.1
pkgrel=4
pkgdesc="C language family frontend for LLVM 13"
arch=('x86_64')
url="https://clang.llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
depends=('llvm13-libs' 'gcc')
makedepends=('llvm13' 'cmake' 'ninja' 'python')
optdepends=('openmp: OpenMP support in clang with -fopenmp'
            'llvm13: referenced by some clang headers')
checkdepends=('llvm')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/clang-$pkgver.src.tar.xz{,.sig}
        $_source_base/llvm-$pkgver.src.tar.xz{,.sig}
        strip-exception-specifications-in-CFI-type-names.patch
        enable-SSP-and-PIE-by-default.patch)
sha256sums=('787a9e2d99f5c8720aa1773e4be009461cd30d3bd40fdd24591e473467c917c9'
            'SKIP'
            'ec6b80d82c384acad2dc192903a6cf2cdbaffb889b84bfb98da9d71e630fc834'
            'SKIP'
            '3f4a2784a4c2b2df13e03beb0b66d5805c520f2b9f16ff76e0557daeb284c8fa'
            '67706047fc93a2e79185d344bdac48219ce042c55ddb9b9397bc98db2153ba58')
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
      # avoid shadowing libclang.so.13 from clang 14
      # https://github.com/llvm/llvm-project/issues/53684#issuecomment-1162669770
      libclang|c-index-test)
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
  patch -Np2 -i ../enable-SSP-and-PIE-by-default.patch
  patch -Np2 -i ../strip-exception-specifications-in-CFI-type-names.patch
}

build() {
  cd clang-$pkgver.src/build

  local cmake_args=(
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr/lib/llvm13
    -DCMAKE_SKIP_RPATH=ON
    -DCLANG_LINK_CLANG_DYLIB=ON
    -DENABLE_LINKER_BUILD_ID=ON
    -DLLVM_BUILD_TESTS=ON
    -DLLVM_CONFIG=/usr/lib/llvm13/bin/llvm-config
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

  mv "$pkgdir"/usr/lib/{llvm13/lib/,}libclang-cpp.so.13
  ln -s ../../libclang-cpp.so.13 "$pkgdir/usr/lib/llvm13/lib/libclang-cpp.so.13"
}

# vim:set ts=2 sw=2 et:
