_srcname=SPIRV-LLVM-Translator
pkgname=mingw-w64-${_srcname,,}
pkgver=15.0.0.r10+g78ad93b9
pkgrel=1
pkgdesc="Tool and a library for bi-directional translation between SPIR-V and LLVM IR (mingw-w64)"
arch=(any)
url="https://github.com/KhronosGroup/SPIRV-LLVM-Translator"
license=(custom)
depends=(mingw-w64-llvm)
makedepends=(git mingw-w64-cmake mingw-w64-llvm mingw-w64-spirv-headers mingw-w64-spirv-tools)
options=('!buildflags' 'staticlibs' '!strip')
# Current point in the used LLVM branch
_commit=78ad93b9952cb78889b86e9aa390d013c49dca0b
source=(git+${url}.git#commit=$_commit)
sha256sums=(SKIP)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd ${_srcname}
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./;s/-/+/'
}

build() {
  cd ${_srcname}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=/usr/${_arch}/include/spirv/ ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/${_srcname}/build-${_arch}"
    make install DESTDIR="$pkgdir"
  done
}


