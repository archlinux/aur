
pkgname=('mingw-w64-llvm')
pkgver=8.0.0
pkgrel=2
pkgdesc="Collection of modular and reusable compiler and toolchain technologies (mingw-w64)"
arch=('any')
url="http://llvm.org/"
license=('custom:University of Illinois/NCSA Open Source License')
depends=('mingw-w64-zlib')
makedepends=('mingw-w64-cmake' 'llvm' 'python2')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://releases.llvm.org/$pkgver/llvm-$pkgver.src.tar.xz")
sha256sums=('8872be1b12c61450cacc82b3d153eab02be2546ef34fa3580ed14137bb26224c')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/llvm-$pkgver.src/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DLLVM_INCLUDE_DOCS=OFF \
      -DLLVM_INCLUDE_TOOLS=OFF \
      -DLLVM_INCLUDE_EXAMPLES=OFF \
      -DLLVM_INCLUDE_TESTS=OFF \
      -DLLVM_ENABLE_ASSERTIONS=OFF \
      -DLLVM_TARGETS_TO_BUILD="X86" \
      -DLLVM_DEFAULT_TARGET_TRIPLE="${_arch}" \
      -DLLVM_TARGET_ARCH="X86" \
      -DLLVM_TABLEGEN=/usr/bin/llvm-tblgen \
      -DLLVM_INFERRED_HOST_TRIPLE=x86_64-pc-linux-gnu \
      -DLLVM_BUILD_LLVM_DYLIB=ON \
      -DBUILD_SHARED_LIBS=OFF \
      -DHAVE_STEADY_CLOCK=0 \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/llvm-$pkgver.src/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
    #${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
  done
}
