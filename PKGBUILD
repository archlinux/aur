# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=mingw-w64-potrace
_pkgname=potrace
pkgver=1.16
pkgrel=1
pkgdesc="Utility for tracing a bitmap (input: PBM,PGM,PPM,BMP; output: EPS,PS,PDF,SVG,DXF,PGM,Gimppath,XFig) (mingw-w64)"
arch=('any')
url='http://potrace.sourceforge.net/'
license=('GPL')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt' 'mingw-w64-zlib')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://potrace.sourceforge.net/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        "001-reaarange-compiler-detect.patch")
sha256sums=('be8248a17dedd6ccbaab2fcc45835bb0502d062e40fbded3bc56028ce5eb7acc'
            'f454e6407e5b23c80feab11a844aef839e539df6c13b63f262d59bacfb89ecd5')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 -i ${srcdir}/001-reaarange-compiler-detect.patch
  autoreconf -fiv
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --mandir=/usr/${_arch}/share/man \
      --with-libpotrace \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_pkgname}-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
