pkgname=mingw-w64-libaec
pkgver=1.0.2
pkgrel=1
pkgdesc="Adaptive Entropy Coding library (mingw-w64)"
arch=('any')
url='https://gitlab.dkrz.de/k202009/libaec'
license=('custom')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
_md5=b30adc1abf805d7454896ab83c900eb8
source=("${url}/uploads/${_md5}/libaec-${pkgver}.tar.gz")
sha256sums=('024722866eb859bf926d6f9cb20edd3f26e80a1bdbea1889e9235d5eca3106d0')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/libaec-${pkgver}"
  for _arch in ${_architectures}; do

    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake \
      -DBUILD_SHARED_LIBS=OFF \
      ..
    make
    popd

    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libaec-${pkgver}/build-${_arch}-static"
    make install DESTDIR="$pkgdir"
    cd "${srcdir}/libaec-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    rm "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
