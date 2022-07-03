# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

_pkgname=clang
pkgname=clang10
pkgver=10.0.1
pkgrel=2
pkgdesc="C language family frontend for LLVM"
arch=('x86_64')
url="https://clang.llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
depends=('llvm10-libs' 'gcc' 'compiler-rt')
makedepends=('llvm10' 'cmake' 'ninja' 'python-sphinx' 'python2')
optdepends=('openmp: OpenMP support in clang with -fopenmp'
            'python: for scan-view and git-clang-format'
            'llvm: referenced by some clang headers')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/$_pkgname-$pkgver.src.tar.xz
        $_source_base/clang-tools-extra-$pkgver.src.tar.xz
        $_source_base/llvm-$pkgver.src.tar.xz
        enable-SSP-and-PIE-by-default.patch)
sha256sums=('f99afc382b88e622c689b6d96cadfa6241ef55dca90e87fc170352e12ddb2b24'
            'd093782bcfcd0c3f496b67a5c2c997ab4b85816b62a7dd5b27026634ccf5c11a'
            'c5d8e30b57cbded7128d78e5e8dad811bff97a8d471896812f57fa99ee82cdf3'
            '9e557a18f3ca96cc5cc9b62d2e308b993025523b2aca0735248118a928c8c3ff')
validpgpkeys+=('B6C8F98282B944E3B0D5C2530FC3042E345AD05D') # Hans Wennborg <hans@chromium.org>
validpgpkeys+=('474E22316ABF4785A88C6E8EA2C794A986419D8A') # Tom Stellard <tstellar@redhat.com>

# Utilizing LLVM_DISTRIBUTION_COMPONENTS to avoid
# installing static libraries; inspired by Gentoo
_get_distribution_components() {
  local target
  ninja -t targets | grep -Po 'install-\K.*(?=-stripped:)' | while read -r target; do
    case $target in
      clang-libraries|distribution)
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
  cd "$srcdir/$_pkgname-$pkgver.src"
  mkdir build
  mv "$srcdir/clang-tools-extra-$pkgver.src" tools/extra
  patch -Np2 -i ../enable-SSP-and-PIE-by-default.patch

  if [[ $pkgver != 10.* ]]; then
    echo "Remove libclangHandleLLVM hack!"
    return 1
  fi
  # Remove libclangHandleLLVM; breaks zig (https://reviews.llvm.org/D75579)
  sed -i '/add_clang_subdirectory(handle-llvm)/d' \
    tools/clang-fuzzer/CMakeLists.txt
}

build() {
  cd "$srcdir/$_pkgname-$pkgver.src/build"

  export PATH=/opt/llvm10/bin:$PATH

  local cmake_args=(
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/opt/llvm10
    -DPYTHON_EXECUTABLE=/usr/bin/python
    -DLLVM_LINK_LLVM_DYLIB=ON
    -DCLANG_LINK_CLANG_DYLIB=ON
    -DLLVM_ENABLE_RTTI=ON
    -DLLVM_BUILD_TESTS=OFF
    -DLLVM_INCLUDE_DOCS=OFF
    -DLLVM_BUILD_DOCS=OFF
    -DLLVM_ENABLE_SPHINX=ON
    -DSPHINX_WARNINGS_AS_ERRORS=OFF
    -DLLVM_EXTERNAL_LIT=/opt/llvm10/bin/lit
    -DLLVM_MAIN_SRC_DIR="$srcdir/llvm-$pkgver.src"
  )

  cmake .. "${cmake_args[@]}"
  local distribution_components=$(_get_distribution_components | paste -sd\;)
  test -n "$distribution_components"
  cmake_args+=(-DLLVM_DISTRIBUTION_COMPONENTS="$distribution_components")

  cmake .. "${cmake_args[@]}"
  ninja
}

_python2_optimize() {
  python2 -m compileall "$@"
  python2 -O -m compileall "$@"
}

_python3_optimize() {
  python3 -m compileall "$@"
  python3 -O -m compileall "$@"
  python3 -OO -m compileall "$@"
}

package() {
  cd "$srcdir/$_pkgname-$pkgver.src/build"

  DESTDIR="$pkgdir" ninja install-distribution
  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Remove documentation sources
  rm -rf "$pkgdir"/opt/llvm10/share/doc/clang{,-tools}/html/{_sources,.buildinfo}

  # Move analyzer scripts out of /usr/libexec
  mv "$pkgdir"/opt/llvm10/libexec/{ccc,c++}-analyzer "$pkgdir/opt/llvm10/lib/clang/"
  rmdir "$pkgdir/opt/llvm10/libexec"
  sed -i 's|libexec|lib/clang|' "$pkgdir/opt/llvm10/bin/scan-build"

  # Install Python bindings
  for _py in 2.7 3.8; do
    install -d "$pkgdir/opt/llvm10/lib/python$_py/site-packages"
    cp -a ../bindings/python/clang "$pkgdir/opt/llvm10/lib/python$_py/site-packages/"
    _python${_py%%.*}_optimize "$pkgdir/opt/llvm10/lib/python$_py"
  done

  # Fix shebang in Python 2 script
  sed -i '1s|/opt/llvm10/bin/env python$|&2|' \
    "$pkgdir"/opt/llvm10/share/$_pkgname/run-find-all-symbols.py
  touch -d @$SOURCE_DATE_EPOCH "$pkgdir"/opt/llvm10/share/$_pkgname/run-find-all-symbols.py

  # Compile Python scripts
  _python2_optimize "$pkgdir/opt/llvm10/share/clang"
  _python3_optimize "$pkgdir/opt/llvm10/share" -x 'clang-include-fixer|run-find-all-symbols'
}

# vim:set ts=2 sw=2 et:
