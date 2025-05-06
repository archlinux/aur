pkgname=clang15
pkgver=15.0.7
pkgrel=4
pkgdesc="C language family frontend for LLVM 15"
arch=('x86_64')
url="https://clang.llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
depends=('llvm15-libs' 'gcc' 'compiler-rt15')
makedepends=('llvm15' 'cmake' 'ninja' 'python')
conflicts=('python-clang15')
optdepends=('openmp: OpenMP support in clang with -fopenmp'
            'python: python bindings'
            'llvm15: referenced by some clang headers')
checkdepends=('llvm')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/clang-$pkgver.src.tar.xz{,.sig}
        $_source_base/llvm-$pkgver.src.tar.xz{,.sig}
        $_source_base/cmake-$pkgver.src.tar.xz{,.sig}
        $pkgname-linker-wrapper-tool-r1.patch
        lit16.patch
        replace-distutils-in-creduce_distutils.patch::https://github.com/llvm/llvm-project/commit/ee341373625163846f4ebc68e46aec6fb46c2c09.patch
        replace-distutils-in-update_cc_test_checks_distutils.patch::https://github.com/llvm/llvm-project/commit/01fdc2a3c9e0df4e54bb9b88f385f68e7b0d808c.patch
        enable-fstack-protector-strong-by-default.patch)
sha256sums=('a6b673ef15377fb46062d164e8ddc4d05c348ff8968f015f7f4af03f51000067'
            'SKIP'
            '4ad8b2cc8003c86d0078d15d987d84e3a739f24aae9033865c027abae93ee7a4'
            'SKIP'
            '8986f29b634fdaa9862eedda78513969fe9788301c9f2d938f4c10a3e7a3e7ea'
            'SKIP'
            'f82449f41c8258f9ae13bd0c311e940711430d2c979eeb8255b36e0e63cda18c'
            '8c8e1a01d3a46b20a78eccec29904edca46caa2c15fb4e8998423098b482e1a2'
            'c4610e4dfae0159bdd794268dae713343a5411b7e10949ea8e917d44e82ba799'
            '031d5690b9cad9e3e04c61b29309c45504d20bed54e385a43381d38ff6bd1307'
            '7a9ce949579a3b02d4b91b6835c4fb45adc5f743007572fb0e28e6433e48f3a5')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A') # Tom Stellard <tstellar@redhat.com>

# Utilizing LLVM_DISTRIBUTION_COMPONENTS to avoid
# installing static libraries; inspired by Gentoo
_get_distribution_components() {
  local target
  cmake --build clang-$pkgver.src/build --target help | grep -Po 'install-\K.*(?=-stripped:)' | while read -r target; do
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

  # this cstdint stuff should no longer be needed if llvm15 gets: sed 's,^#include <memory>,#include <memory>\n#include <cstdint>,' --in-place include/llvm/ADT/SmallVector.h
  local _clang_needs_cstdint=(
    ADT/SmallVector.h
    ADT/SmallString.h
    TableGen/Error.h
    Support/raw_ostream.h
    Support/Error.h
    ADT/Triple.h
  )

  for header in "${_clang_needs_cstdint[@]}"; do
    grep -rl "^#include \"llvm/$header\"" | xargs sed "s,^#include \"llvm/$header\",#include <cstdint>\n#include \"llvm/$header\"," --in-place
  done

  cd ${srcdir}/llvm-${pkgver}.src
  local _llvm_needs_cstdint=(
    Testing/Support/Annotations.h
  )

  for header in "${_llvm_needs_cstdint[@]}"; do
    grep -rl "^#include \"llvm/$header\"" | xargs sed "s,^#include \"llvm/$header\",#include <cstdint>\n#include \"llvm/$header\"," --in-place
  done
  cd -

  mkdir build
  patch -Np2 -i ../enable-fstack-protector-strong-by-default.patch

  # https://reviews.llvm.org/D145862
  patch -Np2 -l -i ../$pkgname-linker-wrapper-tool-r1.patch

  # Fix testing with lit from LLVM 16
  patch -Np2 -i ../lit16.patch

  # distutils fixes
  patch -Np2 -i ../replace-distutils-in-creduce_distutils.patch
  patch -Np2 -d ../llvm-$pkgver.src -i ../replace-distutils-in-update_cc_test_checks_distutils.patch

  # Remove a couple of failing tests
  rm test/Driver/XRay/xray-instrument-{cpu,os}.c
}

_python_optimize() {
  python -m compileall "$@"
  python -O -m compileall "$@"
  python -OO -m compileall "$@"
}

build() {
  # Build only minimal debug info to reduce size
  CFLAGS=${CFLAGS/-g /-g1 }
  CXXFLAGS=${CXXFLAGS/-g /-g1 }

  local cmake_args=(
    -B clang-$pkgver.src/build
    -S clang-$pkgver.src
    -G Ninja
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr/lib/llvm15
    -D CMAKE_SKIP_RPATH=ON
    -D CLANG_DEFAULT_PIE_ON_LINUX=ON
    -D CLANG_LINK_CLANG_DYLIB=ON
    -D ENABLE_LINKER_BUILD_ID=ON
    -D LLVM_CONFIG=/usr/lib/llvm15/bin/llvm-config
    -D LLVM_BUILD_TESTS=ON
    -D LLVM_ENABLE_RTTI=ON
    -D LLVM_EXTERNAL_LIT=/usr/bin/lit
    -D LLVM_LINK_LLVM_DYLIB=ON
    -D LLVM_MAIN_SRC_DIR="$srcdir/llvm-$pkgver.src"
  )

  cmake "${cmake_args[@]}"
  local distribution_components=$(_get_distribution_components | paste -sd\;)
  test -n "$distribution_components"
  cmake_args+=(-D LLVM_DISTRIBUTION_COMPONENTS="$distribution_components")

  cmake "${cmake_args[@]}"
  cmake --build clang-$pkgver.src/build
}

check() {
  cd clang-$pkgver.src/build
  LD_LIBRARY_PATH=$PWD/lib ninja check-clang
}

package() {
  cd clang-$pkgver.src

  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Move scanbuild-py into site-packages and install Python bindings
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/$site_packages"
  #mv "$pkgdir"/usr/lib/libear "$pkgdir/$site_packages/libear15"
  #mv "$pkgdir"/usr/lib/libscanbuild "$pkgdir/$site_packages/libscanbuild15"
  cp -a bindings/python/clang "$pkgdir/$site_packages/clang15"


  mv "$pkgdir"/usr/lib/{llvm15/lib/,}libclang-cpp.so.15
  ln -s ../../libclang-cpp.so.15 "$pkgdir/usr/lib/llvm15/lib/libclang-cpp.so.15"
  ln -s llvm15/lib/libclang.so.15 "$pkgdir"/usr/lib/libclang.so.15

  # Compile Python scripts
  _python_optimize "$pkgdir/usr/share" "$pkgdir/$site_packages"
}


# vim:set ts=2 sw=2 et:
