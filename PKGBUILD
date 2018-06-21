# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-libilbc
pkgver=2.0.2
pkgrel=1
pkgdesc="A friendly copy of the iLBC codec from the WebRTC project (mingw-w64)"
arch=('any')
url="https://github.com/TimothyGu/libilbc/"
license=('custom')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("libilbc-${pkgver}.tar.bz2"::"https://github.com/TimothyGu/libilbc/releases/download/v${pkgver}/libilbc-${pkgver}.tar.bz2")
sha256sums=('88e2dc14e1fccd7b7a0d7f84e96ac22a33c3c86820cee4b0a05e3dcc08c2b096')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() { 
  cd "$srcdir/libilbc-$pkgver/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libilbc-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    
    rm -rf ${pkgdir}/usr/${_arch}/share

    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
