pkgname=openmodelica
pkgver=1.24.3
pkgrel=1
pkgdesc="Open-source Modelica-based modeling and simulation environment"
url="https://www.openmodelica.org"
_giturl="https://github.com/OpenModelica/OpenModelica.git"
license=('OSMC-PL')
arch=('x86_64')
depends=('java-environment' 'lapack' 'openscenegraph' 'boost-libs' 'qt6-webengine' 'qt6-svg' 'qt6-tools' 'qt6-5compat')
makedepends=('gcc-fortran' 'cmake' 'git' 'boost')
options=('!lto')
source=("${pkgname}::git+${_giturl}#tag=v${pkgver}")
sha256sums=('bba08ac365168d858f216daabc1bd3413aa72efca705932dd0a24c169a8caf60')

prepare() {
  cd "${pkgname}"
  git remote set-url origin ${_giturl}
  git submodule update --force --init --recursive

  # boost 1.87 compat
  curl -L https://github.com/OpenModelica/OpenModelica/pull/13441.patch | patch -p1
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
}
