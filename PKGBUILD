pkgname=('mingw-w64-llvm')
pkgver=9.0.0
pkgrel=1
pkgdesc="Collection of modular and reusable compiler and toolchain technologies (mingw-w64)"
arch=('any')
url="http://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
depends=('mingw-w64-zlib' 'mingw-w64-z3' 'mingw-w64-libxml2')
makedepends=('mingw-w64-cmake' 'llvm' 'python')
options=('!strip' '!buildflags' 'staticlibs')
validpgpkeys+=('B6C8F98282B944E3B0D5C2530FC3042E345AD05D') # Hans Wennborg <hans@chromium.org>
validpgpkeys+=('474E22316ABF4785A88C6E8EA2C794A986419D8A') # Tom Stellard <tstellar@redhat.com>
source=(https://releases.llvm.org/$pkgver/llvm-$pkgver.src.tar.xz{,.sig})
sha256sums=('d6a0565cf21f22e9b4353b2eb92622e8365000a9e90a16b09b56f8157eabfe84'
            'SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/llvm-$pkgver.src/"
  sed -i "s|target_link_libraries(benchmark Shlwapi)|target_link_libraries(benchmark shlwapi)|g" utils/benchmark/src/CMakeLists.txt
}

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
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
  done
}
