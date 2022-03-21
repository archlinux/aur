# Maintainer: ahphaw5S
pkgname=medit3d-git
pkgver=r10.883f5e0
pkgrel=1
pkgdesc="OpenGL-based scientific visualization software"
arch=('any')
url="git clone https://github.com/ISCDtoolbox/Medit.git"
license=('unknown')
depends=('freeglut')
makedepends=('git' 'cmake')
sha256sums=('SKIP'
            'cb040eca18a6c8e58104350a8252f0c5bb7a36efca158168f51c64f027953963')
provides=('medit')
source=('git+https://github.com/ISCDtoolbox/Medit.git#branch=master' 'glut_libraries.patch')

_gitroot=https://github.com/ISCDtoolbox/Medit.git
_gitname=Medit

pkgver() {
  cd "${srcdir}/${_gitname}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_gitname}"
  git apply "${srcdir}/glut_libraries.patch"
  cd "${srcdir}"

  CMAKE_SKIP_INSTALL_RPATH=YES cmake -B build -S "${srcdir}/${_gitname}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -Wno-dev
  CMAKE_SKIP_INSTALL_RPATH=YES cmake --build build
}

package() {
  cd "${srcdir}"

  CMAKE_SKIP_INSTALL_RPATH=YES \
                   DESTDIR="${pkgdir}" \
                   cmake --install build \
                         --prefix "/usr"
}
