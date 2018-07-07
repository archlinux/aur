
pkgname=('mingw-w64-llvm')
pkgver=6.0.1
pkgrel=1
pkgdesc="Collection of modular and reusable compiler and toolchain technologies (mingw-w64)"
arch=('any')
url="http://llvm.org/"
license=('custom:University of Illinois/NCSA Open Source License')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'llvm')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://releases.llvm.org/$pkgver/llvm-$pkgver.src.tar.xz")
sha256sums=('b6d6c324f9c71494c0ccaf3dac1f16236d970002b42bb24a6c9e1634f7d0f4e2')


_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/llvm-$pkgver.src/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DLLVM_BUILD_TESTS=OFF \
      -DLLVM_BUILD_DOCS=OFF \
      -DLLVM_BUILD_TOOLS=OFF \
      -DLLVM_ENABLE_SPHINX=OFF \
      -DLLVM_ENABLE_DOXYGEN=OFF \
      -DLLVM_ENABLE_ASSERTIONS=OFF \
      -DLLVM_TARGETS_TO_BUILD="X86" \
      -DLLVM_DEFAULT_TARGET_TRIPLE="${_arch}" \
      -DLLVM_TARGET_ARCH="X86" \
      -DLLVM_TABLEGEN=/usr/bin/llvm-tblgen \
      -DLLVM_INFERRED_HOST_TRIPLE=x86_64-pc-linux-gnu \
      -DLLVM_BUILD_LLVM_DYLIB=ON \
      -DBUILD_SHARED_LIBS=OFF \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/llvm-$pkgver.src/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}"/usr/${_arch}/share
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
  done
}
