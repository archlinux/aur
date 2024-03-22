# Maintainer: Darryl Pogue <darryl at dpogue dot ca>
pkgname=mingw-w64-asio
pkgver=1.28.0
pkgrel=1
pkgdesc="Cross-platform C++ library for ASynchronous network I/O (mingw-w64)"
arch=(any)
url="https://think-async.com/Asio/"
license=("custom:boost")
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure' 'mingw-w64-boost')
optdepends=('mingw-w64-boost: when not using ASIO_STANDALONE')
options=('!strip' '!buildflags' 'staticlibs')
source=(https://sourceforge.net/projects/asio/files/asio/${pkgver}%20%28Stable%29/asio-${pkgver}.tar.bz2 mingw-fix.patch)
sha512sums=('b3fa23caa4cbf1e374fade97102adb22a32c68bd4b050474987c065b516fdf042d46842c41ac94e71458f402fae2d05bc8f617ee523ffb6a74ef33d214e9acd5' '79db383973ba8301ed215134e76821b47ea51c4e0d383d2b35d95a3d9788fd324331acef93ea53c4db54bc87f710aa337401d6cfc1b309b59f35e903d83b8352')
b2sums=('dc0431a6710f58ce037d6e6e1cf81606b6f8be3ac9fdf6f7a69a7998fadb4f3c9dace2aa99606a9570166f9637ca7f4b9ab6964599c78027a9f32a9d243d5684' '7fe5f4a7718ae81114e9ca07da32e5d3db1395a13a55e95520b403f5cfc88d7055a93cb98a37e556c070f36f9d67351eef5697521bddabb9c270dcf1328147a9')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd asio-${pkgver}

  patch --forward --strip=2 --input="${srcdir}/mingw-fix.patch"
}

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
