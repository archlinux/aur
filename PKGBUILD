# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-kvazaar
_pkgname=kvazaar
pkgver=2.0.0
pkgrel=1
pkgdesc="An open-source HEVC encoder (mingw-w64)"
arch=('any')
url='http://ultravideo.cs.tut.fi/#encoder'
license=('LGPL')
depends=('mingw-w64-crypto++')
makedepends=('mingw-w64-configure' 'yasm' 'git')
options=('!strip' '!buildflags' 'staticlibs')
source=("${_pkgname}-${pkgver}.tar.gz"::"https://github.com/ultravideo/kvazaar/archive/v${pkgver}.tar.gz")
sha256sums=('213edca448f127f9c6d194cdfd21593d10331f9061d95751424e1001bae60b5d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./autogen.sh
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    LIBS+=" -lssp" ${_arch}-configure \
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
