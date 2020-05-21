# Maintainer: Sukanka <su975853527 [AT] gmail.com>
pkgname=yade
pkgver=2020.01a
pkgrel=2
pkgdesc="An Open Source Discrete Element Method"
arch=("x86_64")
url='https://yade-dem.org/doc/index.html'
license=('GPL2')
depends=(
    'boost' 'qt5-base' 'freeglut' 'libqglviewer' 'eigen' 'gdb' 'sqlite'
    'python' 'python-numpy' 'ipython' 'python-sphinx' 'python-mpi4py' 
    'python-matplotlib' 'python-xlib' 'python-future'
    # AUR packages
    'python-minieigen-git' 'python-pygraphviz' 'loki-lib' 
)
optdepends=(
    'gl2ps: an OpenGL to PostScript printing library'
    'vtk: open source software for manipulating and displaying scientific data (Recommended)'
    'cgal: Computational Geometry Algorithms Library'
    'suitesparse: sparse algebra library (fluid coupling)'
    'openblas: optimized and parallelized alternative to the standard blas+lapack (fluid coupling)'
    'metis: matrix preconditioning (fluid coupling)'
    'openmpi: library for parallel distributed computing (For MPI and OpenFOAM coupling)'
    
    # simply use sudo pacman -S coin-or to install the following:
    'coin-or-asl: Linear Programming Solver in group coin-or (For PotentialBlock)'
    'coin-or-cbc: Linear Programming Solver in group coin-or (For PotentialBlock)'
    'coin-or-cgl: Linear Programming Solver in group coin-or (For PotentialBlock)'
    'coin-or-clp: Linear Programming Solver in group coin-or (For PotentialBlock)'
    'coin-or-coinutils: Linear Programming Solver in group coin-or (For PotentialBlock)'
    'coin-or-mp: Linear Programming Solver in group coin-or (For PotentialBlock)'
    'coin-or-osi: Linear Programming Solver in group coin-or (For PotentialBlock)'
    
    'mpfr: multiple-precision floating-point library (with python-mpmath)'
    'python-mpmath: arbitrary-precision floating-point library (with mpfr)'
    'cuda: to activate GPU accelerated PFV'
)
makedepends=('cmake')
provides=('yade')
source=("https://launchpad.net/yade/trunk/yade-1.00.0/+download/yade-${pkgver}.tar.bz2")
sha512sums=('91262e24e361bd2f7139426fe32273efb8907271d870eb4f71cf659a2b4ef391123c3e60c39dea1255bbdc4c1ff442a40e0a9eaeb0fff84ade28bd945da6c16e')

prepare(){
    # Follow https://yade-dem.org/doc/installation.html#compilation
    cd "$srcdir"
    mv trunk-${pkgver} trunk 
    mkdir build 
}
build(){
    # WARNING: Package contains reference to $srcdir, but all to "$srcdir"/trunk, I think it's safe. 
    # Anyway, I still want to deal with this, but need help.
    cd "$srcdir"/build
    cmake ../trunk \
        -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib \
        -DENABLE_SPH=ON   -DENABLE_PROFILING=ON  -DCHOLMOD_GPU=ON -DENABLE_PYTHON3=ON -DENABLE_LIQMIGRATION=ON -DENABLE_MASK_ARBITRARY=ON  -DNOSUFFIX=ON \
        -DENABLE_USEFUL_ERRORS=OFF # or build will fail！
    make -j10
}

package(){
    cd "$srcdir"/build
    make install DESTDIR="${pkgdir}"
}
