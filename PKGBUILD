pkgname=openmodelica-omc
pkgver=1.13.2
pkgrel=1

pkgdesc="The Open Source Modelica Suite - OpenModelica Compiler"
arch=('i686' 'x86_64')
url="https://openmodelica.org"
license=('OSMC-PL')
groups=(openmodelica)

_group=OpenModelica
_name=OMCompiler
_tag=v${pkgver}

depends=('java-environment' 'lpsolve' 'hdf5-openmpi' 'omniorb' 'openscenegraph' 'sundials' 'libatomic_ops' 'python' 'gtkglext' 'ruby' 'coin-or-ipopt' 'suitesparse' 'boost-libs')

makedepends=('gcc-fortran' 'boost' 'clang' 'cmake' 'java-environment' 'antlr2' 'git' 'expat' 'ncurses' 'readline' 'opencl-headers' 'imagemagick')

conflicts=('openmodelica-dev' 'openmodelica-dev-omc' 'openmodelica-git')

source=(  "git+https://github.com/${_group}/${_name}.git#tag=${_tag}")
sha1sums=('SKIP')

prepare() {
  cd "$srcdir/$_name"
  git checkout "tags/${_tag}"
  sed -i "s,../,https://github.com/${_group}/,g" .gitmodules
  git submodule sync
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/$_name"
  autoconf
  export CPPFLAGS="$CPPFLAGS -DH5_USE_18_API"
  ./configure --prefix=/usr/ --without-omc --with-omniORB  --with-cppruntime --with-lapack='-llapack -lblas'
  make
}

package() {
  cd "$srcdir/$_name/build"
  mkdir -p ${pkgdir}/usr
  cp -r * ${pkgdir}/usr
}
