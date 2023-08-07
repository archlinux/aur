# Maintainer: Nick Saika <n@nesv.ca>

pkgname=('llvm16' 'llvm16-libs')
pkgver=16.0.6
pkgrel=1
arch=('x86_64')
url="https://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=('cmake' 'ninja' 'zlib' 'zstd' 'libffi' 'libedit' 'ncurses'
             'libxml2' 'python-setuptools' 'python-psutil' 'python-sphinx'
             'python-recommonmark')
options=('staticlibs' '!lto') # Getting thousands of test failures with LTO
_source_base="https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver"
source=(${_source_base}/llvm-${pkgver}.src.tar.xz{,.sig}
        ${_source_base}/cmake-${pkgver}.src.tar.xz{,.sig}
        ${_source_base}/third-party-${pkgver}.src.tar.xz{,.sig}
        llvm-config.h)
sha256sums=('e91db44d1b3bb1c33fcea9a7d1f2423b883eaa9163d3d56ca2aa6d2f0711bc29'
            'SKIP'
            '39d342a4161095d2f28fb1253e4585978ac50521117da666e2b1f6f28b62f514'
            'SKIP'
            '15f5b9aeeba938530af977d5f9205612737a091a7f0f6c8075df8723b7713f70'
            'SKIP'
            '597dc5968c695bbdbb0eac9e8eb5117fcd2773bc91edf5ec103ecffffab8bc48')
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
      # exclude static libraries
      LLVM*)
        continue
        ;;
      # exclude llvm-exegesis (doesn't seem useful without libpfm)
      llvm-exegesis)
        continue
        ;;
    esac
    echo "${target}"
  done
}

prepare() {
  mv cmake{-$pkgver.src,}
  mv third-party{-$pkgver.src,}
  cd "llvm-${pkgver}.src" || exit 1
  mkdir build
}

build() {
  cd "llvm-${pkgver}.src/build" || exit 1

  # Build only minimal debug info to reduce size
  CFLAGS=${CFLAGS/-g /-g1 }
  CXXFLAGS=${CXXFLAGS/-g /-g1 }

  local cmake_args=(
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_DOCDIR=share/doc
    -DCMAKE_INSTALL_PREFIX=/opt/llvm16
    -DCMAKE_SKIP_RPATH=ON
    -DLLVM_BINUTILS_INCDIR=/opt/llvm16/include
    -DLLVM_BUILD_DOCS=ON
    -DLLVM_BUILD_LLVM_DYLIB=ON
    -DLLVM_BUILD_TESTS=ON
    -DLLVM_ENABLE_BINDINGS=OFF
    -DLLVM_ENABLE_FFI=ON
    -DLLVM_ENABLE_RTTI=ON
    -DLLVM_ENABLE_SPHINX=ON
    -DLLVM_HOST_TRIPLE="${CHOST}"
    -DLLVM_INCLUDE_BENCHMARKS=OFF
    -DLLVM_INSTALL_UTILS=ON
    -DLLVM_LINK_LLVM_DYLIB=ON
    -DLLVM_USE_PERF=ON
    -DSPHINX_WARNINGS_AS_ERRORS=OFF
  )

  cmake .. "${cmake_args[@]}"
  local distribution_components=$(_get_distribution_components | paste -sd\;)
  test -n "$distribution_components"
  cmake_args+=(-DLLVM_DISTRIBUTION_COMPONENTS="$distribution_components")

  cmake .. "${cmake_args[@]}"
  ninja
}

check() {
  cd "llvm-${pkgver}.src/build" || exit 1
  LD_LIBRARY_PATH=$PWD/lib ninja check
}

package_llvm16() {
  pkgdesc="Compiler infrastructure"
  depends=('llvm16-libs' 'perl')

  cd "llvm-${pkgver}.src/build" || exit 1

  DESTDIR="$pkgdir" ninja install-distribution

  # Include lit for running lit-based tests in other projects
  pushd ../utils/lit || exit 1
  python3 setup.py install --root="$pkgdir" -O1
  popd || exit 1

  # The runtime libraries go into llvm-libs
  mv -f "$pkgdir"/opt/llvm16/lib/lib{LLVM,LTO,Remarks}*.so* "$srcdir"
  mv -f "$pkgdir"/opt/llvm16/lib/LLVMgold.so "$srcdir"

  if [[ $CARCH == x86_64 ]]; then
    # Needed for multilib (https://bugs.archlinux.org/task/29951)
    # Header stub is taken from Fedora
    mv "$pkgdir/opt/llvm16/include/llvm/Config/llvm-config"{,-64}.h
    cp "$srcdir/llvm-config.h" "$pkgdir/opt/llvm16/include/llvm/Config/llvm-config.h"
  fi

  # Remove documentation sources
  rm -r "$pkgdir"/opt/llvm16/share/doc/llvm/html/{_sources,.buildinfo}

  cp -rf "$pkgdir"/usr/{bin,lib} "$pkgdir"/opt/llvm16
  rm -rf "${pkgdir:?}"/usr

  install -Dm644 ../LICENSE.TXT "$pkgdir/opt/llvm16/share/licenses/$pkgname/LICENSE"
}

package_llvm16-libs() {
  pkgdesc="LLVM runtime libraries"
  depends=('gcc-libs' 'zlib' 'zstd' 'libffi' 'libedit' 'ncurses' 'libxml2')

  install -d "$pkgdir/opt/llvm16/lib"
  cp -P \
    "$srcdir"/lib{LLVM,LTO,Remarks}*.so* \
    "$srcdir"/LLVMgold.so \
    "$pkgdir/opt/llvm16/lib/"

  # Symlink LLVMgold.so from /usr/lib/bfd-plugins
  # https://bugs.archlinux.org/task/28479
  install -d "$pkgdir/opt/llvm16/lib/bfd-plugins"
  ln -s ../LLVMgold.so "$pkgdir/opt/llvm16/lib/bfd-plugins/LLVMgold.so"

  install -Dm644 "/dev/null" "$pkgdir/etc/ld.so.conf.d/70-llvm16.libs.conf"
  echo "/opt/llvm16/lib" > "$pkgdir/etc/ld.so.conf.d/70-llvm16.libs.conf"

  install -Dm644 "$srcdir/llvm-$pkgver.src/LICENSE.TXT" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
