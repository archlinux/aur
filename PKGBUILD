# Maintainer: Julian Hornich <hornich at kth dot se>
pkgname=dolfin-hpc
pkgver=0.9.2_hpc_20200914
pkgrel=1
pkgdesc="DOLFIN HPC is a special branch of DOLFIN optimized for distributed memory architectures"
_tag=0.9.2-hpc
arch=('i686' 'x86_64')
url="https://bitbucket.org/adaptivesimulations/dolfin-hpc/"
license=('LGPL')
groups=('dolfin-hpc-git')
depends=('python' 'ffc-hpc-git' 'petsc' 'parmetis' 'gts' 'openmpi' 'parallel-hashmap-git')
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

_petsc_dir=/opt/petsc/linux-c-opt

prepare() {
    cd dolfin-hpc
    sh regen.sh
    ./configure --prefix=${pkgdir}/opt/${pkgname} PYTHON=python3 CXXFLAGS="-O3 -march=native" \
                --with-petsc=${_petsc_dir} --with-gts --enable-python --with-parmetis \
                --enable-quadrature --enable-mpi --enable-mpi-io --with-phmap --enable-function-cache \
                --enable-optimize-p1 --enable-opt-basis --with-convert
}

build() {
    cd dolfin-hpc
    make ${MAKEFLAGS}
}

package() {
    cd dolfin-hpc
    make install
}
