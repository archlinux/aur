# Maintainer: Julian Hornich <hornich at kth dot se>
pkgname=dolfin-hpc
pkgver=0.9.0_hpc_20200205
pkgrel=1
pkgdesc="DOLFIN HPC is a special branch of DOLFIN optimized for distributed memory architectures"
_tag=0.9.0-hpc
arch=('i686' 'x86_64')
url="https://bitbucket.org/adaptivesimulations/dolfin-hpc/"
license=('LGPL')
groups=('dolfin-hpc-git')
depends=('python2' 'ffc-hpc-git' 'libxml2' 'petsc' 'parmetis' 'gts' 'openmpi')
optdepends=()
makedepends=('git' 'python' 'sed' 'gcc')
provides=('dolfin')
conflicts=('dolfin')
options=(!emptydirs)
source=("dolfin-hpc::git+https://bitbucket.org/adaptivesimulations/dolfin-hpc.git#tag=${_tag}")
md5sums=('SKIP')

pkgver() {
    cd dolfin-hpc
    echo "${_tag}_$(git log --format="%cd" --date=short -1 | sed 's/-//g')" | sed 's/-/_/g'
}

prepare() {
    cd dolfin-hpc
    sh regen.sh
    ./configure --prefix=${pkgdir}/opt/dolfin PYTHON=python2 CXXFLAGS="-O3 -march=native -std=c++14" \
    		--with-petsc=/opt/petsc/linux-c-opt --with-gts --with-xml --enable-python --with-parmetis \
    		--enable-quadrature --enable-mpi --enable-mpi-io
}

build() {
    cd dolfin-hpc
    make ${MAKEFLAGS}
}

package() {
    cd dolfin-hpc
    make install
}
