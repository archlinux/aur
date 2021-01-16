# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=kicad-footprints-git
pkgver=5.1.6.r202.g2ba0d5cb6
pkgrel=1
pkgdesc="Official KiCad Footprint Libraries for KiCad from git"
arch=(any)
url=https://gitlab.com/kicad/libraries/kicad-footprints
license=('CC-BY-SA 4.0')
makedepends=(
cmake
git
ninja
)
conflicts=('kicad-library-bzr' 'kicad-library-git' 'kicad-library' 'kicad-footprints')
provides=('kicad-footprints')
source=(git+https://gitlab.com/kicad/libraries/kicad-footprints.git)
md5sums=('SKIP')

options=('!strip')

pkgver() {
  cd kicad-footprints
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd kicad-footprints
  cmake \
    -W no-dev \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -G Ninja \
    -B build_dir \
    -S .

  cmake --build build_dir
}

package() {
  cd kicad-footprints
  DESTDIR="${pkgdir}" cmake --build build_dir -- install

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE.md
}
