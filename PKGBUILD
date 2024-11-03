pkgname=openmodelica
pkgver=1.24.0
pkgrel=3
pkgdesc="Open-source Modelica-based modeling and simulation environment"
url="https://www.openmodelica.org"
_giturl="https://github.com/OpenModelica/OpenModelica.git"
license=('OSMC-PL')
arch=('x86_64')
depends=('java-environment' 'lapack' 'openscenegraph' 'boost-libs' 'qt6-webengine' 'qt6-svg' 'qt6-tools')
makedepends=('gcc-fortran' 'cmake' 'git' 'boost')
options=('!lto')
source=("${pkgname}::git+${_giturl}#tag=v${pkgver}")
sha256sums=('c18f2030032b417d1afd37d90090e8de8e2e4f0f9364c01b2db0caea5b4cd26e')

prepare() {
  cd "${pkgname}"
  git remote set-url origin ${_giturl}
  git submodule update --force --init --recursive

  # Library index file //.openmodelica/libraries/index.json doesn't exist
  curl -L https://github.com/OpenModelica/OpenModelica/pull/13078.patch | patch -p1

  sed -i "s|Qt5|Qt6|g" OMSens_Qt/CMakeLists.txt
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
