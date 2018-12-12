# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-libatomic_ops
pkgver=7.6.8
pkgrel=1
pkgdesc="Provides semi-portable access to hardware provided atomic memory operations (mingw-w64)"
arch=('any')
url="https://github.com/ivmai/libatomic_ops"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=('!strip' '!buildflags' 'staticlibs')
license=('GPL2' 'MIT')
source=("https://github.com/ivmai/libatomic_ops/releases/download/v${pkgver}/libatomic_ops-${pkgver}.tar.gz")
sha1sums=('628fe98e9e1703c64028454bdfed022f18659aff')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}"/libatomic_ops-${pkgver}
  ./autogen.sh
}

build() {
  cd "${srcdir}"/libatomic_ops-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libatomic_ops-${pkgver}/build-${_arch}"
    make install DESTDIR="${pkgdir}"
    rm -r "${pkgdir}"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip --strip-debug "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
