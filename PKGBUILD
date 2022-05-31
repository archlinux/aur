pkgname=mingw-w64-libaec
pkgver=1.0.6
pkgrel=1
pkgdesc="Adaptive Entropy Coding library (mingw-w64)"
arch=('any')
url='https://gitlab.dkrz.de/k202009/libaec'
license=('custom')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
_md5=ea0b7d197a950b0c110da8dfdecbb71f
source=("${url}/-/archive/v${pkgver}/libaec-v${pkgver}.tar.bz2")
sha256sums=('31fb65b31e835e1a0f3b682d64920957b6e4407ee5bbf42ca49549438795a288')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/libaec-v${pkgver}"
  for _arch in ${_architectures}; do

    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake -DBUILD_TESTING=OFF -DBUILD_SHARED_LIBS=OFF ..
    make
    popd

    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DBUILD_TESTING=OFF ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libaec-v${pkgver}/build-${_arch}-static"
    make install DESTDIR="$pkgdir"
    cd "${srcdir}/libaec-v${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    rm "${pkgdir}"/usr/${_arch}/bin/*.exe
    rm -r "${pkgdir}"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
