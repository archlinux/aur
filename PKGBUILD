# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=mingw-w64-directx-headers-cmake
pkgdesc="DirectX headers for using D3D12 (mingw-w64)"
pkgver=1.608.2
pkgrel=1
arch=('any')
makedepends=('mingw-w64-cmake' 'ninja')
url="https://github.com/microsoft/DirectX-Headers"
license=('MIT')
options=('staticlibs' '!strip' '!buildflags')
source=(directx-headers-${pkgver}.tar.gz::https://github.com/microsoft/DirectX-Headers/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('6d2b2ee19e744ce5e0e9716367ad38ebf94dd5ef18a014971594f29eb67bd87e')

# This does not exactly provide "mingw-w64-directx-headers"
# due to missing pkg-config, but it conflicts.
# This is an upstream issue.

conflicts=('mingw-w64-directx-headers')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    ${_arch}-cmake -S DirectX-Headers-$pkgver -B build/${_arch} -G Ninja \
      -DDXHEADERS_BUILD_TEST=OFF \
      -DDXHEADERS_BUILD_GOOGLE_TEST=OFF

    cmake --build build/${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" cmake --install build/${_arch}
  done
}
