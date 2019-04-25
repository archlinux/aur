# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-kvazaar
_pkgname=kvazaar
pkgver=1.2.0
pkgrel=2
pkgdesc="An open-source HEVC encoder (mingw-w64)"
arch=('any')
url='http://ultravideo.cs.tut.fi/#encoder'
license=('LGPL')
depends=('mingw-w64-crypto++')
makedepends=('mingw-w64-configure' 'yasm' 'git')
options=('!strip' '!buildflags' 'staticlibs')
source=("${_pkgname}-${pkgver}.tar.gz"::"https://github.com/ultravideo/kvazaar/archive/v${pkgver}.tar.gz"
        'kvazaar-crypto++6.0.0.patch')
sha256sums=('480ecfd9b4d2b7d21b355e4a35fcf47b4db7a3b0315b6219d93733db42392bd9'
            '02396099561b9c87462420ee6b16706237c7502938c1b3ab9fc3797ea2ec568a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/kvazaar-crypto++6.0.0.patch"
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
