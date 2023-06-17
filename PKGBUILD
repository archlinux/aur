# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Laurent Carlier <lordheavym@archlinux.org>
# Contributor: Cyano Hao <c@cyano.cn>

pkgname=directx-headers-cmake
pkgdesc="DirectX headers for using D3D12 (Provides CMake config)"
pkgver=1.610.2
pkgrel=2
arch=('x86_64')
makedepends=('cmake' 'meson' 'ninja')
url="https://github.com/microsoft/DirectX-Headers"
license=('MIT')
source=(directx-headers-${pkgver}.tar.gz::https://github.com/microsoft/DirectX-Headers/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('59492497e99bd3c23f8f8aa8a709f4d7b5bc5bd5057efa8c568bbad40015a8b2')
conflicts=('directx-headers')
provides=('directx-headers')

build() {
  # build with cmake for cmake config file (does not provide pkgconfig files though, so we keep meson too)
  cmake -S DirectX-Headers-$pkgver -B build-cmake -G Ninja \
    -DDXHEADERS_BUILD_TEST=OFF \
    -DDXHEADERS_BUILD_GOOGLE_TEST=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  cmake --build build-cmake

  # LTO breaks mesa...
  export CXXFLAGS="$CXXFLAGS -fno-lto"

  arch-meson DirectX-Headers-$pkgver build \
    -Dbuild-test=false
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build-cmake
  DESTDIR="${pkgdir}" meson install -C build
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" DirectX-Headers-$pkgver/LICENSE
}
