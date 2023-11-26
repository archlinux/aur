# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=('llvm17' 'llvm17-libs')
pkgver=17.0.5
pkgrel=1
arch=('x86_64')
url="https://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=('cmake' 'ninja' 'zlib' 'zstd' 'libffi' 'libedit' 'ncurses'
             'libxml2' 'python')
checkdepends=('python-psutil')
options=('staticlibs')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/llvm-$pkgver.src.tar.xz{,.sig}
        $_source_base/cmake-$pkgver.src.tar.xz{,.sig}
        $_source_base/third-party-$pkgver.src.tar.xz{,.sig})
b2sums=('9d00e77970b7e14f69b920c7ad7c63f9a7dca4f07ec74c1e36596f244cce65b32e39a45e9551f8ae46f064a0317f5eaa46ecbe0cebcb8e7b100b57f60fc9a69f'
        'SKIP'
        '3950b0701ab15bdeffcdf1b3658fd690f92f183f7399115a9906c91da8f0bd75b1c9a9a751bafd4da2304443cdba30387f0998073214f76bf372eeb97437f4ed'
        'SKIP'
        '8ee055699f933fc4c44cd502f6003e5976b073a66def5044b86d14636cc20232935f0f1304ad0da44a651b23301d79073a19f52a55817eb81c592e6fc0a5c765'
        'SKIP')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A') # Tom Stellard <tstellar@redhat.com>

# Utilizing LLVM_DISTRIBUTION_COMPONENTS to avoid
# installing static libraries; inspired by Gentoo
_get_distribution_components() {
  local target
  ninja -C build -t targets | grep -Po 'install-\K.*(?=-stripped:)' | while read -r target; do
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
      # exclude static libraries
      LLVM*)
        continue
        ;;
      # exclude llvm-exegesis (doesn't seem useful without libpfm)
      llvm-exegesis)
        continue
        ;;
      # testing libraries
      LLVMTestingAnnotations|LLVMTestingSupport)
        ;;
    esac
    echo $target
  done
}

prepare() {
  rename -v -- "-$pkgver.src" '' {cmake,third-party}-$pkgver.src
}

build() {
  cd llvm-$pkgver.src

  # Build only minimal debug info to reduce size
  CFLAGS=${CFLAGS/-g /-g1 }
  CXXFLAGS=${CXXFLAGS/-g /-g1 }

  local cmake_args=(
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr/lib/llvm17
    -DCMAKE_INSTALL_DOCDIR=share/doc
    -DCMAKE_SKIP_RPATH=ON
    -DLLVM_BINUTILS_INCDIR=/usr/include
    -DLLVM_BUILD_DOCS=ON
    -DLLVM_BUILD_LLVM_DYLIB=ON
    -DLLVM_BUILD_TESTS=ON
    -DLLVM_ENABLE_BINDINGS=OFF
    -DLLVM_ENABLE_FFI=ON
    -DLLVM_ENABLE_RTTI=ON
    -DLLVM_ENABLE_SPHINX=OFF #
    -DLLVM_HOST_TRIPLE=$CHOST
    -DLLVM_INCLUDE_BENCHMARKS=OFF
    -DLLVM_INSTALL_UTILS=ON
    -DLLVM_LINK_LLVM_DYLIB=ON
    -DLLVM_USE_PERF=ON
    -DSPHINX_WARNINGS_AS_ERRORS=OFF
  )

  cmake "${cmake_args[@]}" -B build
  local distribution_components=$(_get_distribution_components | paste -sd\;)
  test -n "$distribution_components"
  cmake_args+=(-DLLVM_DISTRIBUTION_COMPONENTS="$distribution_components")

  cmake "${cmake_args[@]}" -B build
  ninja -C build

  cd utils/lit
  python -m build --wheel --no-isolation
}

check() {
  cd llvm-$pkgver.src/build
  LD_LIBRARY_PATH=$PWD/lib ninja check
}

package_llvm17() {
  pkgdesc="Compiler infrastructure (LLVM 17)"
  depends=('llvm17-libs' 'perl')

  cd llvm-$pkgver.src/build

  DESTDIR="$pkgdir" ninja install-distribution

  # The runtime libraries go into llvm17-libs
  mv -f "$pkgdir"/usr/lib/llvm17/lib/libLLVM-{17,$pkgver}.so "$srcdir/"
  mv -f "$pkgdir"/usr/lib/llvm17/lib/LLVMgold.so "$srcdir/"

  # Create versioned symlinks from /usr/bin/ to /usr/lib/llvm17/bin/
  install -d "$pkgdir/usr/bin"
  local _binary
  for _binary in "$pkgdir"/usr/lib/llvm17/bin/*; do
    local _basename=${_binary##*/}
    ln -s ../lib/llvm17/bin/$_basename "$pkgdir/usr/bin/$_basename-17"
  done

  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_llvm17-libs() {
  pkgdesc="LLVM 17 runtime libraries"
  depends=('gcc-libs' 'zlib' 'libffi' 'libedit' 'ncurses' 'libxml2')

  install -d "$pkgdir/usr/lib/llvm17/lib"
  cp -P "$srcdir"/libLLVM-{17,$pkgver}.so "$pkgdir/usr/lib/"
  ln -s ../../libLLVM-17.so "$pkgdir/usr/lib/llvm17/lib/libLLVM-17.so"
  ln -s ../../libLLVM-17.so "$pkgdir/usr/lib/llvm17/lib/libLLVM-$pkgver.so"
  cp -P "$srcdir"/LLVMgold.so "$pkgdir/usr/lib/llvm17/lib/"

  install -Dm644 "$srcdir/llvm-$pkgver.src/LICENSE.TXT" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_llvm-lit() {
  pkgdesc="An LLVM testing tool"
  depends=('python')
  cd $srcdir/llvm-$pkgver.src/utils/lit
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
