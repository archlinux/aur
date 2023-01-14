pkgname=mingw-w64-directx-headers
pkgdesc="DirectX headers for using D3D12 (mingw-w64)"
pkgver=1.608.0
pkgrel=1
arch=('any')
makedepends=('mingw-w64-meson')
url="https://github.com/microsoft/DirectX-Headers"
license=('MIT')
options=('staticlibs' '!strip' '!buildflags')
source=(directx-headers-${pkgver}.tar.gz::https://github.com/microsoft/DirectX-Headers/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('da852607ada1d0cab6e9358b00f7a82e1391fa12c7a95b7ad6341aa5fd7809f5')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd DirectX-Headers-$pkgver
  for _arch in ${_architectures}; do
    ${_arch}-meson build-${_arch} -Dbuild-test=false -Db_lto=false
    ninja -C build-${_arch} ${MAKEFLAGS}
  done
}

package() {
  cd DirectX-Headers-$pkgver
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" ninja -C build-${_arch} install
  done
}

