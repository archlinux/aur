pkgname=openmodelica-omc
pkgver=1.19.2
pkgrel=1
pkgdesc="The Open Source Modelica Suite - OpenModelica Compiler"
arch=('x86_64')
url="https://openmodelica.org"
license=('OSMC-PL')
_giturl="https://github.com/OpenModelica/OpenModelica.git"
groups=(openmodelica)
depends=('lapack' 'expat' 'lpsolve' 'java-environment')
makedepends=('gcc-fortran' 'cmake' 'git' 'boost')
source=("git+${_giturl}#tag=v${pkgver}")
sha1sums=('SKIP')

prepare() {
  cd "$srcdir/OpenModelica"
  git remote set-url origin ${_giturl}
  git submodule update --force --init --recursive OMCompiler/3rdParty
}

build() {
  cd "$srcdir/OpenModelica/OMCompiler"
  autoreconf -vfi
  ./configure --prefix=/usr/
  make

  # bundle a static version of lapack required to build fmus
  curl -fsSL https://github.com/Reference-LAPACK/lapack/archive/v3.10.1.tar.gz | tar xz
  cd lapack-3.10.1 && mkdir -p build && cd build
  cmake -DBUILD_TESTING=OFF -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF ..
  make
}

package() {
  cd "$srcdir/OpenModelica/OMCompiler"
  make install DESTDIR="${pkgdir}"
  chmod go+rx "${pkgdir}"/usr/share/omc/runtime/c/fmi/buildproject/config.*
  install -m644 lapack-3.10.1/build/lib/lib*.a "${pkgdir}"/usr/lib/x86_64-linux-gnu/omc
}
