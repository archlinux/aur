pkgname=openmodelica
pkgver=1.25.5
pkgrel=1
pkgdesc="Open-source Modelica-based modeling and simulation environment"
url="https://www.openmodelica.org"
_giturl="https://github.com/OpenModelica/OpenModelica.git"
license=('OSMC-PL')
arch=('x86_64')
depends=('java-environment' 'lapack' 'openscenegraph' 'boost-libs' 'qt6-webengine' 'qt6-svg' 'qt6-tools' 'qt6-5compat')
provides=('openmodelica-omc')
makedepends=('gcc-fortran' 'cmake' 'git' 'boost')
options=('!lto')
source=("${pkgname}::git+${_giturl}#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd "${pkgname}"
  git remote set-url origin ${_giturl}
  git submodule update --force --init --recursive
}

build() {
  cd "${pkgname}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DOM_USE_CCACHE=OFF -DOM_QT_MAJOR_VERSION=6 -B build .
  make -C build
}

package() {
  cd "${pkgname}"
  make install -C build DESTDIR="${pkgdir}"
  rm -r "${pkgdir}"/usr/share/zmq
  rm -r "${pkgdir}"/usr/share/cminpack
  rm -r "${pkgdir}"/usr/include/cminpack-1
  rm -r "${pkgdir}"/home
}
