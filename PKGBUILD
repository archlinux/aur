# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-gts
pkgver=0.7.6
pkgrel=1
pkgdesc="Provides useful functions to deal with 3D surfaces meshed with interconnected triangles (mingw-w64)"
arch=('any')
url="http://gts.sourceforge.net/"
license=('LGPL')
makedepends=('mingw-w64-configure' 'mingw-w64-wine')
depends=('mingw-w64-crt' 'mingw-w64-glib2')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://downloads.sourceforge.net/project/gts/gts/${pkgver}/gts-${pkgver}.tar.gz"
        "gts-mingw.patch")
sha256sums=('059c3e13e3e3b796d775ec9f96abdce8f2b3b5144df8514eda0cc12e13e8b81e'
            'd16c24ce5766c9dc36a2ad02d1298c79f7576a29ac8ec79268020fa9bc453f60')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/gts-$pkgver/"
  patch -Np1 -i "${srcdir}/gts-mingw.patch"
  autoreconf -fiv
}

build() {
  cd "${srcdir}/gts-$pkgver/"
  export LDFLAGS=${LDFLAGS//--as-needed,}
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/build-${_arch}" && pushd "${srcdir}/build-${_arch}"
    cp -rf "${srcdir}/gts-$pkgver/." "${srcdir}/build-${_arch}"
    ${_arch}-configure .
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
