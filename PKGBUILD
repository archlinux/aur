pkgname=mingw-w64-libsquish
pkgver=1.15.1.3
pkgrel=1
pkgdesc="DXT compression library (mingw-w64)"
arch=(any)
url="https://oblivioncth.github.io/libsquish/"
license=("MIT")
makedepends=(mingw-w64-cmake)
depends=(mingw-w64-libpng)
options=(!strip !buildflags staticlibs !debug)
source=("https://github.com/oblivioncth/libsquish/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('16acbc13343c2624bc468d1001a060f7a2eeddfbc308ec9dd5ce1eba5a7301bc')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd libsquish-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DCMAKE_BUILD_TYPE=Release -B build-${_arch} .
    cmake --build build-${_arch}
  done
}

package() {
  cd libsquish-${pkgver}
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --build build-${_arch} --target install
    rm "${pkgdir}"/usr/${_arch}/{README.md,LICENSE}
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
  done
}
