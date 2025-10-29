pkgname=openmodelica-omc
pkgver=1.25.5
pkgrel=1
pkgdesc="The Open Source Modelica Suite - OpenModelica Compiler"
arch=('x86_64')
url="https://openmodelica.org"
license=('OSMC-PL')
_giturl="https://github.com/OpenModelica/OpenModelica.git"
groups=(openmodelica)
conflicts=(openmodelica)
depends=('lapack' 'java-environment')
makedepends=('gcc-fortran' 'cmake' 'git' 'boost')
options=('!lto')
source=("git+${_giturl}#tag=v${pkgver}")
sha1sums=('SKIP')

prepare() {
  cd "$srcdir/OpenModelica"
  git remote set-url origin ${_giturl}
  git submodule update --force --init --recursive OMCompiler/3rdParty
}

build() {
  cd "$srcdir/OpenModelica"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DOM_USE_CCACHE=OFF -DOM_ENABLE_GUI_CLIENTS=OFF -B build .
  make -C build
}

package() {
  cd "$srcdir/OpenModelica"
  make install -C build DESTDIR="${pkgdir}"
  rm -r "${pkgdir}"/usr/share/zmq
  rm -r "${pkgdir}"/usr/share/cminpack
  rm -r "${pkgdir}"/usr/include/cminpack-1
}
