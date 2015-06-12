# Maintainer: Randy Heydon <randy dot heydon at clockworklab dot net>
# Contributor: saxonbeta <saxonbeta at gmail __com
pkgname=elmerfem-git
_pkgname=elmerfem
pkgver=20150611.25b81fc
pkgrel=1
pkgdesc="Simulation tool for CFD, FEM, electromagnetics, heat transfer and others featuring a PDE solver."
arch=('i686' 'x86_64')
url="http://www.csc.fi/english/pages/elmer"
license=('GPL')
depends=('qwt' 'vtk5' 'suitesparse' 'arpack' 'glu' 'qtwebkit' 'tk')
makedepends=('git' 'gcc-fortran' 'cmake')
provides=(elmerfem)
conflicts=('elmer_umfpack' 'elmerfem-svn')
options=(!emptydirs !makeflags)

source=('git+https://github.com/ElmerCSC/elmerfem.git')
sha256sums=(SKIP)


pkgver() {
    cd "$srcdir/$_pkgname/"
    (git log -1 --format='%cd.%h' --date=short | tr -d -)
}


prepare() {
    cd "$srcdir/$_pkgname/ElmerGUI"
    cp Application/forms/* Application/src/
}


build() {
    cd "$srcdir/$_pkgname"
    export LDFLAGS="-lX11"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DELMER_INSTALL_LIB_DIR=/usr/lib \
        -DELMER_SOLVER_HOME=/usr/share/elmersolver \
        -DWITH_MPI:BOOL=TRUE \
        -DWITH_OpenMP:BOOL=TRUE \
        -DWITH_ELMERGUI:BOOL=TRUE \
        -DWITH_QWT:BOOL=TRUE \
        -DWITH_VTK:BOOL=TRUE \
        -DWITH_OCC:BOOL=FALSE \
        -DWITH_ELMERPOST:BOOL=TRUE \

    make all
}


package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir" install

    ln -s ElmerSolver_mpi $pkgdir/usr/bin/ElmerSolver
    rm -- $pkgdir/usr/lib/{libparpack.so,libarpack.so}
    mv $pkgdir/usr/share/elmersolver/lib/*.so $pkgdir/usr/lib
}
