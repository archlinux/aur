# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=kicad-symbols-git
pkgver=5.1.6.r591.ge012b90c
pkgrel=1
pkgdesc="KiCad schematic symbol libraries from the official git repo"
arch=(any)
url=https://gitlab.com/kicad/libraries/kicad-package
license=('CC-BY-SA 4.0')
makedepends=(
cmake
git
ninja
)
conflicts=('kicad-library-bzr' 'kicad-library-git' 'kicad-library' 'kicad-symbols')
provides=('kicad-symbols')
source=(git+https://gitlab.com/kicad/libraries/kicad-symbols.git)
md5sums=('SKIP')

options=('!strip')

pkgver() {
  cd kicad-symbols
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd kicad-symbols
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
  cd kicad-symbols
  DESTDIR="${pkgdir}" cmake --build build_dir -- install

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE.md
}
