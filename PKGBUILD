pkgname=('mingw-w64-scnlib')
pkgver=4.0.1
pkgrel=1
pkgdesc="A formatted input library, think {fmt} but in the other direction. 'scanf' for modern C++ (mingw-w64)"
url="https://github.com/eliaskosunen/scnlib"
arch=('any')
license=('Apache-2.0')
makedepends=('mingw-w64-cmake' 'mingw-w64-fast_float')
options=('!strip' '!buildflags' 'staticlibs')
depends=('mingw-w64-crt')
source=("https://github.com/eliaskosunen/scnlib/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ece17b26840894cc57a7127138fe4540929adcb297524dec02c490c233ff46a7')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


prepare() {
  cd scnlib-${pkgver}
  curl -L https://github.com/eliaskosunen/scnlib/commit/144a590.patch | patch -p1
}

build() {
  cd scnlib-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DSCN_EXAMPLES=OFF -DSCN_TESTS=OFF -DSCN_BENCHMARKS=OFF -DSCN_DOCS=OFF \
      -DSCN_BENCHMARKS=OFF -DSCN_BENCHMARKS_BUILDTIME=OFF -DSCN_BENCHMARKS_BINARYSIZE=OFF \
      -DSCN_USE_EXTERNAL_FAST_FLOAT=ON -B build-${_arch} .
    make -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/scnlib-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
  done
}
