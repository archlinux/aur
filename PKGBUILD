# Maintainer: Ivan Puntiy <ivan.puntiy-at-gmail>
pkgname=mingw-w64-asio
pkgver=1.12.2
pkgrel=1
pkgdesc="Cross-platform C++ library for ASynchronous network I/O (mingw-w64)"
arch=(any)
url="http://asio.sourceforge.net/"
license=("custom")
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure' 'mingw-w64-boost')
optdepends=('mingw-w64-boost: when not using ASIO_STANDALONE')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://downloads.sourceforge.net/asio/asio-${pkgver}.tar.bz2")
sha256sums=('4e27dcb37456ba707570334b91f4798721111ed67b69915685eac141895779aa')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd asio-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/asio-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
  done

  #license
  install -D -m644 "${srcdir}/asio-${pkgver}/LICENSE_1_0.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
