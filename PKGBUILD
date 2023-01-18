pkgname=('mingw-w64-llvm')
pkgver=15.0.7
pkgrel=1
pkgdesc="Collection of modular and reusable compiler and toolchain technologies (mingw-w64)"
arch=('any')
url="http://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
depends=('mingw-w64-zlib' 'mingw-w64-z3' 'mingw-w64-libxml2' 'mingw-w64-libffi' 'mingw-w64-zstd')
makedepends=('mingw-w64-cmake' "llvm>=${pkgver%%.*}" 'python')
options=('!strip' '!buildflags' 'staticlibs')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/llvm-$pkgver.src.tar.xz{,.sig}
        $_source_base/cmake-$pkgver.src.tar.xz{,.sig})
sha256sums=('4ad8b2cc8003c86d0078d15d987d84e3a739f24aae9033865c027abae93ee7a4'
            'SKIP'
            '8986f29b634fdaa9862eedda78513969fe9788301c9f2d938f4c10a3e7a3e7ea'
            'SKIP')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A'  # Tom Stellard <tstellar@redhat.com>
              'D574BD5D1D0E98895E3BF90044F2485E45D59042') # Tobias Hieta <tobias@hieta.se>

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  mv cmake{-$pkgver.src,}
  cd "$srcdir/llvm-$pkgver.src/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DLLVM_INCLUDE_DOCS=OFF \
      -DLLVM_INCLUDE_TOOLS=OFF \
      -DLLVM_INCLUDE_EXAMPLES=OFF \
      -DLLVM_BUILD_LLVM_DYLIB=ON \
      -DLLVM_INCLUDE_TESTS=OFF \
      -DLLVM_ENABLE_BINDINGS=OFF \
      -DLLVM_ENABLE_FFI=ON \
      -DLLVM_ENABLE_RTTI=ON \
      -DLLVM_INCLUDE_BENCHMARKS=OFF \
      -DLLVM_ENABLE_ASSERTIONS=OFF \
      -DLLVM_TARGETS_TO_BUILD="X86;AMDGPU" \
      -DLLVM_DEFAULT_TARGET_TRIPLE="${_arch}" \
      -DLLVM_TARGET_ARCH="X86" \
      -DLLVM_TABLEGEN=/usr/bin/llvm-tblgen \
      -DLLVM_INFERRED_HOST_TRIPLE=x86_64-pc-linux-gnu \
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
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
  done
}
