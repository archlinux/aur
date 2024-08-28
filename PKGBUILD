pkgname=openmodelica
pkgver=1.23.1
pkgrel=1
pkgdesc="Open-source Modelica-based modeling and simulation environment"
url="https://www.openmodelica.org"
_giturl="https://github.com/OpenModelica/OpenModelica.git"
license=('OSMC-PL')
arch=('x86_64')
depends=('java-environment' 'lapack' 'openscenegraph' 'boost-libs' 'qt5-webengine' 'qt5-xmlpatterns' 'qt5-svg' 'qt5-tools')
makedepends=('gcc-fortran' 'cmake' 'git' 'boost')
options=('!lto')
source=("${pkgname}::git+${_giturl}#tag=v${pkgver}")
sha256sums=('4b6c911b04c2c52d3121bb9fc61d9f8202d003aa308daffcdcfa9eaafa85aacf')

prepare() {
  cd "${pkgname}"
  git remote set-url origin ${_giturl}
  git submodule update --force --init --recursive
  curl -L https://github.com/OpenModelica/OMCompiler-3rdParty/pull/158.patch | patch -p1 -d OMCompiler/3rdParty
  curl -L https://github.com/OpenModelica/OMSimulator/pull/1295.patch | patch -p1 -d OMSimulator
  sed -i "s|Werror=uninitialized|Wno-error=uninitialized|g" OMSimulator/src/OMSimulatorLib/CMakeLists.txt
  sed -i "s|CMAKE_CXX_STANDARD 14|CMAKE_CXX_STANDARD 17|g" OMSimulator/3rdParty/xerces/CMakeLists.txt
  sed -i "58i#include <QScreen>" OMEdit/OMEditLIB/Modeling/LibraryTreeWidget.cpp
}

build() {
  cd "${pkgname}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DOM_USE_CCACHE=OFF -DOM_OMEDIT_ENABLE_QTWEBENGINE=ON -B build .
  make -C build
}

package() {
  cd "${pkgname}"
  make install -C build DESTDIR="${pkgdir}"
  rm -r "${pkgdir}"/usr/share/zmq
}
