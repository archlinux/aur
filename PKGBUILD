# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=kicad-library-3d-git
pkgver=5.1.6.r29.g1080b6e5
pkgrel=1
pkgdesc="https://gitlab.com/kicad/libraries/kicad-packages3D"
arch=(any)
url=https://gitlab.com/kicad/libraries/kicad-packages3D
license=('CC-BY-SA 4.0')
options=('!strip')
makedepends=(
  stepreduce-git
  cmake
  git
  ninja)
conflicts=('kicad-library-3d')
provides=('kicad-library-3d')
source=(git+https://gitlab.com/kicad/libraries/kicad-packages3D.git)
sha256sums=('SKIP')

pkgver() {
  cd kicad-packages3D
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd kicad-packages3D
}

build() {
  cd kicad-packages3D

  # use this many threads to shrink the step files
  _ensmall_threads=1

  msg2 "First ensmall the step files"
  find -name '*.step' -print0 | xargs -0 -P ${_ensmall_threads} -I % sh -c 'stepreduce % %.reduced; mv %.reduced %'
  
  msg2 'Then use cmake to "build"'
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
  cd kicad-packages3D
  DESTDIR="${pkgdir}" cmake --build build_dir -- install

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE.md
}

