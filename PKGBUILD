# $Id: PKGBUILD 278874 2016-10-17 09:20:23Z arojas $
# Maintainer: Eric Bélanger <eric@archlinux.org>

_pkgname=libsamplerate
pkgname=mingw-w64-libsamplerate
pkgver=0.2.1
pkgrel=1
pkgdesc="Secret Rabbit Code - aka Sample Rate Converter for audio (mingw-w64)"
arch=('any')
url="https://libsndfile.github.io/libsamplerate/index.html"
license=('BSD')
depends=('mingw-w64-libsndfile' 'mingw-w64-opus')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' '!staticlibs')
source=("https://github.com/libsndfile/$_pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.bz2")
b2sums=('83540f3e75cfa79cbd166f075d22cab6a63e0e057b90ac6a3760c07196cac962df7d1ca26620a9033de046e0528bee3ded2b482e8629b1ae316844b5b31f3074')
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
}

build() {
  cd ${_pkgname}-${pkgver}
  for _arch in ${_architectures}; do
    mkdir build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ..
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
