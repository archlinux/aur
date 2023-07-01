# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=mingw-w64-zimg
pkgver=3.0.5
pkgrel=1
pkgdesc="Scaling, colorspace conversion, and dithering library (mingw-w64)"
arch=('any')
url="https://github.com/sekrit-twc/zimg"
license=("custom:WTFPL")
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("zimg-${pkgver}.tar.gz::https://github.com/sekrit-twc/zimg/archive/release-${pkgver}.tar.gz")
sha256sums=('a9a0226bf85e0d83c41a8ebe4e3e690e1348682f6a2a7838f1b8cbff1b799bcf')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/zimg-release-${pkgver}"
  ./autogen.sh
}

build() {
  cd "${srcdir}/zimg-release-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
    --enable-x86simd \
    ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/zimg-release-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -rf ${pkgdir}/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
