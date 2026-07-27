# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=openloco-git
pkgver=26.07.1.r2.g867306691
pkgrel=2
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
provides=(openloco)
conflicts=(openloco)
source=("git+https://github.com/openloco/openloco.git")
sha256sums=('SKIP')

pkgver() {
  cd openloco
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local _flags=(
    -DFETCHCONTENT_QUIET=OFF
  )

  cmake -G "Unix Makefiles" -B build -S "openloco" -Wno-author \
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

  install -D "openloco/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
