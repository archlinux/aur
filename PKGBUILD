# Maintainer: Cleboost <clement.balarot@gmail.com>
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=beammp-launcher
pkgver=2.8.1
pkgrel=1
pkgdesc="Multiplayer Launcher/Client for BeamMP, providing multiplayer for BeamNG.drive"
url="https://github.com/BeamMP/BeamMP-Launcher"
arch=("x86_64")
depends=("curl" "openssl" "zlib")
makedepends=("cmake" "vcpkg" "ninja")
license=("LGPL3")

source=("beammp-launcher-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz" "vcpkg::git+https://github.com/microsoft/vcpkg.git")
sha256sums=('fb49ee9ab310927805ac448d2ddf47a25c9893a9deced0c8bdd7f5f33409d649'
            'SKIP')

prepare() {
  export VCPKG_ROOT="${srcdir}/vcpkg"
  cd "${srcdir}/BeamMP-Launcher-${pkgver}"
  vcpkg install --triplet x64-linux
}

build() {
  cd "${srcdir}/BeamMP-Launcher-${pkgver}"
  cmake . -B bin \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_TOOLCHAIN_FILE="${srcdir}/vcpkg/scripts/buildsystems/vcpkg.cmake" \
    -DVCPKG_TARGET_TRIPLET=x64-linux \
    -GNinja
  cmake --build bin --parallel
}

package() {
  install -Dm755 "${srcdir}/BeamMP-Launcher-${pkgver}/bin/BeamMP-Launcher" "${pkgdir}/usr/bin/beammp-launcher"
}

