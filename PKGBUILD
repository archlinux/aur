# Maintainer: Chris Novoa <dev at chrisnovoa dot com>
# Contributor: Grey Christoforo <first name at last name dot net>
# Contributor: Thomas K.

pkgname=kicad-libraries-git
pkgver=5.1.6.r235.g2f244c565
pkgrel=1
pkgdesc="KiCad footprint, symbol, template, and 3D libraries (branch: master)"
arch=(any)
url=https://gitlab.com/kicad/libraries
license=('CC-BY-SA 4.0')
options=('!strip')
makedepends=(
cmake
ninja
git
stepreduce-git
parallel
)
conflicts=(
kicad-library
kicad-library-nightly
kicad-templates
kicad-templates-git
kicad-symbols
kicad-symbols-git
kicad-footprints
kicad-footprints-git
kicad-library-3d
kicad-library-3d-git
kicad-library-3d-nightly
kicad-packages3d
kicad-packages3d-git
)
provides=(kicad-library)
source=(
git+https://gitlab.com/kicad/libraries/kicad-templates.git
git+https://gitlab.com/kicad/libraries/kicad-footprints.git
git+https://gitlab.com/kicad/libraries/kicad-symbols.git
git+https://gitlab.com/kicad/libraries/kicad-packages3D.git
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd kicad-footprints
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  pushd kicad-packages3D
  msg2 "ensmall the step files"
  find -name '*.step' | parallel 'stepreduce {} {}.reduced; mv {}.reduced {};'
  popd
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

  pushd kicad-packages3D
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

  pushd kicad-packages3D
  DESTDIR="${pkgdir}" cmake --build build_dir -- install
  popd
}


