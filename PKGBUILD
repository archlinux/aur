# $Id: PKGBUILD 278874 2016-10-17 09:20:23Z arojas $
# Maintainer: Eric Bélanger <eric@archlinux.org>

_pkgname=libsamplerate
pkgname=mingw-w64-libsamplerate
pkgver=0.1.9
pkgrel=1
pkgdesc="Secret Rabbit Code - aka Sample Rate Converter for audio (mingw-w64)"
arch=('any')
url="http://www.mega-nerd.com/SRC/index.html"
license=('BSD')
depends=('mingw-w64-libsndfile')
makedepends=('mingw-w64-configure')
options=('!strip' '!buildflags' '!staticlibs')
source=(http://www.mega-nerd.com/SRC/libsamplerate-${pkgver}.tar.gz
        no-examples-or-tests.patch)
sha1sums=('ed60f957a4ff87aa15cbb1f3dbd886fa7e5e9566'
          'e789d29476e3f1548d6cc939423e4a1d20d90fbf')
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
