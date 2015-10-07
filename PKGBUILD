#Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgdesc="Basic math, geometry, and robotics, and other routines used in projects from Kris Hauser's lab"
url='https://github.com/krishauser/KrisLibrary'
pkgname=krislibrary-git
pkgver=r331.c8ff3fe
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('cmake' 'doxygen' 'git')
depends=('boost' 'freeglut' 'glpk' 'glui' 'libgl' 'tinyxml' 'assimp')
optdepends=()
_dir=KrisLibrary
source=("git+https://github.com/krishauser/KrisLibrary")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_dir}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"

  cmake "${srcdir}/${_dir}" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_BUILD_TYPE=Release
}

build() {
  cd "${srcdir}/build"
  make
}

#check() {
#    cd "${srcdir}/build/test"
#    make test
#}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
