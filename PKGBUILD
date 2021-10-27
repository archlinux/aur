# $Id: PKGBUILD 278874 2016-10-17 09:20:23Z arojas $
# Maintainer: Eric Bélanger <eric@archlinux.org>

_pkgname=libsamplerate
pkgname=mingw-w64-libsamplerate
pkgver=0.2.2
pkgrel=1
pkgdesc="Secret Rabbit Code - aka Sample Rate Converter for audio (mingw-w64)"
arch=('any')
url="https://libsndfile.github.io/libsamplerate/index.html"
license=('BSD')
depends=('mingw-w64-libsndfile' 'mingw-w64-opus')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' '!staticlibs')
source=("https://github.com/libsndfile/$_pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.xz")
b2sums=('71b1e8a1644a94fff019abc6bf98c557df84994293f1e9bc651ad3ad3f0afeb24f54b8c75fc26e5202ae7c3a3e34e783fd1be7f7c6fdefe9eac9a5dfe7100b91')
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
    mkdir shared-${_arch} && pushd shared-${_arch}
      ${_arch}-cmake -DBUILD_SHARED_LIBS=ON ..
      make
    popd
    mkdir static-${_arch} && pushd static-${_arch}
      ${_arch}-cmake -DBUILD_SHARED_LIBS=OFF ..
      make
    popd
  done
}

package() {
  cd ${_pkgname}-${pkgver}
  for _arch in ${_architectures}; do
    pushd static-${_arch}
      make DESTDIR="${pkgdir}" install
    popd && pushd shared-${_arch}
      make DESTDIR="${pkgdir}" install
    popd
    rm -r "${pkgdir}"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done

  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
