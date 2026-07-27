# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Mr.Smith1974

pkgname=openloco
pkgver=26.07.1
pkgrel=1
pkgdesc="An open source re-implementation of Chris Sawyer's Locomotion"
arch=(x86_64)
url="https://github.com/OpenLoco/OpenLoco"
license=(MIT)
depends=(
    fmt
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/OpenLoco/OpenLoco/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6d2e4b0248778102d80a2459fd820af06095f398768aeddfc0ce2bab16f2038d')

build() {
  export CXXFLAGS+=" -Wno-template-body"

  local _flags=(
    -DFETCHCONTENT_QUIET=OFF
  )

  cmake -G "Unix Makefiles" -B build -S "OpenLoco-${pkgver}" -Wno-author \
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

  install -d "${pkgdir}"/usr/share/openloco
  mv "${pkgdir}"/usr/bin/* "${pkgdir}"/usr/share/openloco
  ln -s /usr/share/openloco/OpenLoco "${pkgdir}/usr/bin/openloco"

  install -D "OpenLoco-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
