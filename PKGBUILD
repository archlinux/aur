# $Id: PKGBUILD 278874 2016-10-17 09:20:23Z arojas $
# Maintainer: Eric Bélanger <eric@archlinux.org>

_pkgname=libsamplerate
pkgname=mingw-w64-libsamplerate
pkgver=0.1.9
pkgrel=2
pkgdesc="Secret Rabbit Code - aka Sample Rate Converter for audio (mingw-w64)"
arch=('any')
url="http://www.mega-nerd.com/SRC/index.html"
license=('BSD')
depends=('mingw-w64-libsndfile')
makedepends=('mingw-w64-configure')
options=('!strip' '!buildflags' '!staticlibs')
source=(http://www.mega-nerd.com/SRC/libsamplerate-${pkgver}.tar.gz
        no-examples-or-tests.patch)
sha256sums=('0a7eb168e2f21353fb6d84da152e4512126f7dc48ccb0be80578c565413444c1'
            '6a0936d24874b5f7b0afdacf192a443c81a6bd9a94155deba6c7a4e844d8a41a')
validpgpkeys=('73571E85C19F4281D8C97AA86CA41A7743B8D6C8')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${_pkgname}-${pkgver}

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done

  autoreconf -fi
}

build() {
  cd ${_pkgname}-${pkgver}
  for _arch in ${_architectures}; do
    mkdir build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  cd ${_pkgname}-${pkgver}
  for _arch in ${_architectures}; do
    pushd build-${_arch}
    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
    popd
  done

  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
