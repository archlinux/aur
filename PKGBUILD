pkgname=openmodelica-omc
pkgver=1.22.1
pkgrel=1
pkgdesc="The Open Source Modelica Suite - OpenModelica Compiler"
arch=('x86_64')
url="https://openmodelica.org"
license=('OSMC-PL')
_giturl="https://github.com/OpenModelica/OpenModelica.git"
groups=(openmodelica)
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
  cd "$srcdir/OpenModelica/OMCompiler"
  autoreconf -vfi
  ./configure --prefix=/usr/ --without-omc
  make
}

package() {
  cd "$srcdir/OpenModelica/OMCompiler"
  make install DESTDIR="${pkgdir}"
  chmod go+rx "${pkgdir}"/usr/share/omc/runtime/c/fmi/buildproject/config.*
}
