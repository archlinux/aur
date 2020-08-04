pkgname=mingw-w64-svt-hevc
pkgver=1.5.0
pkgrel=1
pkgdesc="The Scalable Video Technology for HEVC Encoder (SVT-HEVC Encoder) is an HEVC-compliant encoder library core. (mingw-w64)"
arch=('any')
url="https://github.com/OpenVisualCloud/SVT-HEVC"
license=('GPL')
depends=(mingw-w64-crt)
makedepends=('mingw-w64-cmake' 'yasm')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/OpenVisualCloud/SVT-HEVC/archive/v${pkgver}.tar.gz")
sha256sums=('5331213ce3fe73d5fe2887cf3aabcd8ffde2fafd0e5f09928d412dc8306f3992')

_architectures="x86_64-w64-mingw32"

build() {
  cd "$srcdir/svt-hevc"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DCMAKE_BUILD_TYPE='Release' ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/svt-hevc/build-${_arch}"
    make install DESTDIR="$pkgdir"
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
