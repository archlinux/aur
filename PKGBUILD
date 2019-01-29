# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>

_base=dolfin
_fragment="#branch=master"
pkgname=${_base}-git
pkgdesc="the C++ interface of FEniCS, providing a consistent PSE (Problem Solving Environment) for ordinary and partial differential equations."
pkgver=20190128
pkgrel=1
arch=('i686' 'x86_64')
url="https://bitbucket.org/fenics-project/${_base}"
license=('GPL3')
groups=('fenics-git')
#depends=('cppunit' 'eigen' 'gl2ps' 'hdf5' 'python-ffc-git' 'petsc' 'suitesparse')
depends=('cppunit' 'eigen' 'gl2ps' 'python-ffc-git' 'petsc' 'suitesparse')
optdepends=('scotch: libraries for graph, mesh and hypergraph partitioning'
            'slepc: eigenvalue problem solvers')
makedepends=('git')
options=(!emptydirs)
source=("${_base}::git+https://bitbucket.org/fenics-project/${_base}.git${_fragment}")
md5sums=('SKIP')

export MAKEFLAGS="-j1"

pkgver() {
  cd ${_base}
  git log --format="%cd" --date=short -1 | sed 's/-//g'
}

build() {
  cd ${_base}
  [ -d build ] && rm -rf build
  mkdir build
  cd build

  sed -i -e '/SNESTEST/s/.*/\/\/&/' ../dolfin/nls/PETScSNESSolver.cpp

  local py_interp=`python -c "import os,sys; print(os.path.realpath(sys.executable))"`

  [ -n "$PETSC_DIR" ] && source /etc/profile.d/petsc.sh
  [ -n "$SLEPC_DIR" ] && source /etc/profile.d/slepc.sh

  # HDF5 is not working when building the python interface, so it's been disabled.
  cmake ..\
    -DCMAKE_INSTALL_PREFIX="${pkg}"/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DPYTHON_EXECUTABLE="${py_interp}" \
    -DCMAKE_SKIP_BUILD_RPATH=TRUE \
    -DCMAKE_SKIP_RPATH=TRUE \
    -DDOLFIN_ENABLE_HDF5=FALSE \
    -DCMAKE_BUILD_TYPE="Release"

  make
}

package() {
  cd ${_base}/build
  make install DESTDIR="${pkgdir}"
}

# vim: fileencoding=utf-8 spelllang=en shiftwidth=2 expandtab
