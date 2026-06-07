# Maintainer: Cleboost <clement.balarot@gmail.com>
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=beammp-launcher
pkgver=2.8.0
pkgrel=1
pkgdesc="Multiplayer Launcher/Client for BeamMP, providing multiplayer for BeamNG.drive"
url="https://github.com/BeamMP/BeamMP-Launcher"
arch=("x86_64")
depends=("curl" "openssl" "zlib")
makedepends=("cmake" "vcpkg" "ninja")
license=("LGPL3")

source=("beammp-launcher-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('351e5b8d159126f3369bde3dac4a881c4b7ceea52255fdf3093ba912450b65bc')

prepare() {
  cd "${srcdir}/BeamMP-Launcher-${pkgver}"
  VCPKG_ROOT=/opt/vcpkg /opt/vcpkg/vcpkg install --triplet x64-linux
}

build() {
  cd "${srcdir}/BeamMP-Launcher-${pkgver}"
  cmake . -B bin \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_TOOLCHAIN_FILE=/opt/vcpkg/scripts/buildsystems/vcpkg.cmake \
    -DVCPKG_TARGET_TRIPLET=x64-linux \
    -GNinja
  cmake --build bin --parallel
}

package() {
  install -Dm755 "${srcdir}/BeamMP-Launcher-${pkgver}/bin/BeamMP-Launcher" "${pkgdir}/usr/bin/beammp-launcher"
}

