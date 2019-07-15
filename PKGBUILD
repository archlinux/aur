# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-kvazaar
_pkgname=kvazaar
pkgver=1.3.0
pkgrel=1
pkgdesc="An open-source HEVC encoder (mingw-w64)"
arch=('any')
url='http://ultravideo.cs.tut.fi/#encoder'
license=('LGPL')
depends=('mingw-w64-crypto++')
makedepends=('mingw-w64-configure' 'yasm' 'git')
options=('!strip' '!buildflags' 'staticlibs')
source=("${_pkgname}-${pkgver}.tar.gz"::"https://github.com/ultravideo/kvazaar/archive/v${pkgver}.tar.gz")
sha256sums=('f694fe71cc6e3e6f583a9faf380825ea93b2635c4db8d1d3121b9ebcf736ac1c')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./autogen.sh
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --enable-largefile \
      --with-cryptopp
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
