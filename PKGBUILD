pkgname=mingw-w64-directx-headers
pkgdesc="DirectX headers for using D3D12 (mingw-w64)"
pkgver=1.721.2
pkgrel=1
arch=('any')
makedepends=('mingw-w64-meson' 'mingw-w64-cmake')
url="https://github.com/microsoft/DirectX-Headers"
license=('MIT')
options=('staticlibs' '!strip' '!buildflags')
source=(directx-headers-${pkgver}.tar.gz::https://github.com/microsoft/DirectX-Headers/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('b736c311057f2b426eb465d4e7867da4eb4e76d69be27f45bfa359189f97c0b0')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd DirectX-Headers-$pkgver
  for _arch in ${_architectures}; do
    # build with cmake for cmake config file (does not provide pkgconfig files though, so we keep meson too)
    ${_arch}-cmake -B build-${_arch}-cmake -G Ninja -DDXHEADERS_BUILD_TEST=OFF -DDXHEADERS_BUILD_GOOGLE_TEST=OFF
    cmake --build build-${_arch}-cmake

    ${_arch}-meson build-${_arch} -Dbuild-test=false -Db_lto=false
    ninja -C build-${_arch} ${MAKEFLAGS}
  done
}

package() {
  cd DirectX-Headers-$pkgver
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" cmake --install build-${_arch}-cmake
    DESTDIR="$pkgdir" ninja -C build-${_arch} install
  done
}

