pkgname=openmodelica
pkgver=1.25.0
pkgrel=1
pkgdesc="Open-source Modelica-based modeling and simulation environment"
url="https://www.openmodelica.org"
_giturl="https://github.com/OpenModelica/OpenModelica.git"
license=('OSMC-PL')
arch=('x86_64')
depends=('java-environment' 'lapack' 'openscenegraph' 'boost-libs' 'qt6-webengine' 'qt6-svg' 'qt6-tools' 'qt6-5compat')
makedepends=('gcc-fortran' 'cmake3-bin' 'git' 'boost')
options=('!lto')
source=("${pkgname}::git+${_giturl}#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd "${pkgname}"
  git remote set-url origin ${_giturl}
  git submodule update --force --init --recursive

  # cdaskr / gcc15
  curl -L https://github.com/OpenModelica/OMCompiler-3rdParty/pull/170.patch | patch -p1 -d OMCompiler/3rdParty
}

build() {
  cd "${pkgname}"
  PATH=/opt/cmake3/bin:$PATH cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DOM_USE_CCACHE=OFF -DOM_QT_MAJOR_VERSION=6 -B build .
  make -C build
}

package() {
  cd "${pkgname}"
  make install -C build DESTDIR="${pkgdir}"
  rm -r "${pkgdir}"/usr/share/zmq
}
