pkgname=openmodelica-omc
pkgver=1.22.2
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
source=("git+${_giturl}#tag=v${pkgver}")
sha1sums=('SKIP')

prepare() {
  cd "$srcdir/OpenModelica"
  git remote set-url origin ${_giturl}
  git submodule update --force --init --recursive OMCompiler/3rdParty

  # link with shared blas/lapack libs: https://github.com/OpenModelica/OpenModelica/issues/10304
  sed -i "s|-Wl,-Bstatic -lSimulationRuntimeFMI \$LDFLAGS \$LD_LAPACK -Wl,-Bdynamic|-Wl,-Bstatic -lSimulationRuntimeFMI -Wl,-Bdynamic \$LDFLAGS \$LD_LAPACK|g" OMCompiler/configure.ac
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
}
