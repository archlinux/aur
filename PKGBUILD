pkgname=openmodelica-omc
pkgver=1.16.5
pkgrel=1
pkgdesc="The Open Source Modelica Suite - OpenModelica Compiler"
arch=('x86_64')
url="https://openmodelica.org"
license=('OSMC-PL')
groups=(openmodelica)
depends=('lapack' 'expat' 'lpsolve' 'omniorb' 'java-environment')
makedepends=('gcc-fortran' 'cmake' 'git')
source=("git+https://github.com/OpenModelica/OpenModelica.git#tag=v${pkgver}")
sha1sums=('SKIP')

prepare() {
  cd "$srcdir/OpenModelica"
  git checkout "tags/v${pkgver}"
  sed -i "s,\.\./,https://github.com/OpenModelica/,g" .gitmodules
  git submodule sync
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/OpenModelica/OMCompiler"
  autoreconf -vfi
  export CPPFLAGS="$CPPFLAGS -DH5_USE_18_API"
  ./configure --prefix=/usr/ --without-omc --with-omniORB  --with-cppruntime --with-lapack='-llapack -lblas'
  make
}

package() {
  cd "$srcdir/OpenModelica/OMCompiler"
  make install DESTDIR="${pkgdir}"
  chmod go+rx "${pkgdir}"/usr/share/omc/runtime/c/fmi/buildproject/config.*
}
