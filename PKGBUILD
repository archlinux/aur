# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Mr.Smith1974

pkgname=openloco
pkgver=26.05
pkgrel=1
pkgdesc="An open source re-implementation of Chris Sawyer's Locomotion"
arch=(x86_64)
url="https://github.com/OpenLoco/OpenLoco"
license=(MIT)
depends=(
    glibc
    hicolor-icon-theme
    libgcc
    libpng
    libstdc++
    onetbb
    openal
    sdl3
    yaml-cpp
    )
makedepends=(
    cmake
    git
    gtest
    )
optdepends=(
    'libpipewire: audio output'
    'libpulse: audio output'
    )
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/OpenLoco/OpenLoco/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c5d036bc6a290e34b4430621621ba230534820cdf663e6c859654fe944574609')

build() {
  local _flags=(
    -DFETCHCONTENT_QUIET=OFF
  )

  cmake -G "Unix Makefiles" -B build -S "OpenLoco-${pkgver}" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  ln -s /usr/bin/OpenLoco                    "${pkgdir}/usr/bin/openloco"
  install -D "OpenLoco-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  #remove bundled sfl from package
  rm -rf "${pkgdir}/usr/share/include/sfl"

  # remove bundled fmt
  rm -rf "${pkgdir}/usr/share/include/fmt"
  rm -rf "${pkgdir}/usr/share/lib"
}
