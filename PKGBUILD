
pkgname=('mingw-w64-llvm')
pkgver=5.0.1
pkgrel=1
pkgdesc="Low Level Virtual Machine (mingw-w64) (WIP)"
arch=('any')
url="http://llvm.org/"
license=('custom:University of Illinois/NCSA Open Source License')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://releases.llvm.org/$pkgver/llvm-$pkgver.src.tar.xz")
sha256sums=('5fa7489fc0225b11821cab0362f5813a05f2bcf2533e8a4ea9c9c860168807b0'
            'SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

# https://llvm.org/docs/HowToCrossCompileLLVM.html
# https://llvm.org/docs/CMake.html

build() {
  cd "$srcdir/llvm-$pkgver.src/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_CROSSCOMPILING=TRUE \
      -DCMAKE_INSTALL_PREFIX=/usr/${_arch} \
      -DLLVM_BUILD_TESTS=OFF \
      -DLLVM_BUILD_DOCS=OFF \
      -DLLVM_BUILD_TOOLS=OFF \
      -DLLVM_ENABLE_SPHINX=OFF \
      -DLLVM_ENABLE_DOXYGEN=OFF \
      -DLLVM_ENABLE_ASSERTIONS=OFF \
      -DLLVM_TARGETS_TO_BUILD="X86" \
      -DLLVM_DEFAULT_TARGET_TRIPLE="${_arch}" \
      -DLLVM_HOST_TRIPLE="${_arch}" \
      -DLLVM_TARGET_ARCH="X86" \
      -DLLVM_TABLEGEN=/usr/bin/llvm-tblgen \
      ..
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/llvm-$pkgver.src/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
  done
}
