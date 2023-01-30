pkgname=mingw-w64-directx-headers
pkgdesc="DirectX headers for using D3D12 (mingw-w64)"
pkgver=1.608.2
pkgrel=1
arch=('any')
makedepends=('mingw-w64-meson')
url="https://github.com/microsoft/DirectX-Headers"
license=('MIT')
options=('staticlibs' '!strip' '!buildflags')
source=(directx-headers-${pkgver}.tar.gz::https://github.com/microsoft/DirectX-Headers/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('684a784dc61c90a84a592374deb4d788e5b18f4160ca5ff34a98cf3b9c92c773')

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

