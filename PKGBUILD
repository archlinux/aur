# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=kicad-library-git
pkgver=5.1.6.r202.g2ba0d5cb6
pkgrel=1
pkgdesc="KiCad footprint, symbol and template libraries"
arch=(any)
url=https://gitlab.com/kicad/libraries
license=('CC-BY-SA 4.0')
options=('!strip')
makedepends=(
cmake
ninja
git
)
conflicts=(kicad-library kicad-templates kicad-templates-git kicad-symbols-git kicad-symbols kicad-footprints kicad-footprints-git)
provides=(kicad-library)
source=(
git+https://gitlab.com/kicad/libraries/kicad-templates.git
git+https://gitlab.com/kicad/libraries/kicad-footprints.git
git+https://gitlab.com/kicad/libraries/kicad-symbols.git
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd kicad-footprints
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  pushd kicad-templates
  cmake \
    -W no-dev \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -G Ninja \
    -B build_dir \
    -S .
  cmake --build build_dir
  popd

  pushd kicad-footprints
  cmake \
    -W no-dev \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -G Ninja \
    -B build_dir \
    -S .
  cmake --build build_dir
  popd

  pushd kicad-symbols
  cmake \
    -W no-dev \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -G Ninja \
    -B build_dir \
    -S .
  cmake --build build_dir
  popd
}

package() {
  pushd kicad-templates
  DESTDIR="${pkgdir}" cmake --build build_dir -- install
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE.md
  popd

  pushd kicad-footprints
  DESTDIR="${pkgdir}" cmake --build build_dir -- install
  popd  
  
  pushd kicad-symbols
  DESTDIR="${pkgdir}" cmake --build build_dir -- install
  popd
}

