pkgname=openmodelica-dev-qwt
pkgver=1.13.0
pkgrel=1

pkgdesc="The Open Source Modelica Suite - OpenModelica qwt Library"
arch=('i686' 'x86_64')
url="https://openmodelica.org"
license=('OSMC-PL')
groups=(openmodelica-dev)

_group=OpenModelica
_name=OMPlot
_commit=7f2c3327a03328c0686b9f97331a83a35d2bb80c

depends=('java-environment' 'lpsolve' 'hdf5-openmpi' 'omniorb' 'openscenegraph' 'sundials' 'libatomic_ops' 'python' 'gtkglext' 'ruby' 'coin-or-ipopt' 'qjson' 'suitesparse' 'boost-libs' 'qt5-webkit' 'qt5-svg' 'qt5-tools')

makedepends=('openmodelica-dev-omc' 'gcc-fortran' 'boost' 'clang' 'cmake' 'java-environment' 'antlr2' 'git' 'expat' 'ncurses' 'readline' 'opencl-headers' 'imagemagick')

provides=('openmodelica-qwt')
conflicts=('openmodelica' 'openmodelica-qwt' 'openmodelica-git')

source=(  "git+https://github.com/${_group}/${_name}.git#commit=${_commit}")
sha1sums=('SKIP')

prepare() {
  cd "$srcdir/$_name"
  git checkout "${_commit}"
  sed -i "s,../,https://github.com/${_group}/,g" .gitmodules
  git submodule sync
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/$_name"
  autoconf
  export CPPFLAGS="$CPPFLAGS -DH5_USE_18_API"
  ./configure --prefix=/usr/ CXX=clang++

  make qwt-build
}

package() {
  mkdir -p ${pkgdir}/usr
  cd "$srcdir/$_name/build"
  cp -r include ${pkgdir}/usr

  cd "$srcdir/$_name/qwt/build"
  cp -r features ${pkgdir}/usr
  cp -r lib ${pkgdir}/usr
}
