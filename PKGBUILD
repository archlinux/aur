# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas Dziedzic <gostrc at gmail dot com>
# Contributor: Osman Ugus <ugus11 at yahoo dot com>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>

pkgname=sagemath-git
pkgver=10.3.beta0.r0.g272582be9e0
pkgrel=1
pkgdesc='Open Source Mathematics Software, free alternative to Magma, Maple, Mathematica, and Matlab'
arch=(x86_64)
url='http://www.sagemath.org'
license=(GPL)
depends=(brial
         cblas
         cliquer
         ecl
         eclib
         fflas-ffpack
         flint
         gap
         gcc-libs
         gd
         gfan
         giac
         givaro
         glibc
         glpk
         gmp
         gmp-ecm
         gsl
         iml
         ipython
         lcalc
         libbraiding
         libhomfly
         libmpc
         linbox
         lrcalc
         m4ri
         m4rie
         maxima-fas
         mpfi
         mpfr
         nauty
         ntl
         palp
         pari
         pari-galdata
         pari-seadata-small
         planarity
         python
         python-cvxopt
         python-cysignals
         python-cypari2
         python-docutils
         python-fpylll
         python-ipywidgets
         python-matplotlib
         python-memory-allocator
         python-mpmath
         python-networkx
         python-numpy
         python-pexpect
         python-pillow
         python-pplpy
         python-primecountpy
         python-pygments
         python-pyparsing
         python-requests
         python-rpy2
         python-scipy
         python-sphinx
         python-sympy
         python-traitlets
         rankwidth
         sage-data-combinatorial_designs
         sage-data-conway_polynomials
         sage-data-elliptic_curves
         sage-data-graphs
         sage-data-polytopes_db
         singular
         symmetrica
         sympow
         tachyon
         threejs-sage)
optdepends=('benzene: for generating fusenes and benzenoids'
            'blas-openblas: faster linear algebra'
            'bliss: bliss backend for graph theory'
            'buckygen: for generating fullerene graphs'
            'coin-or-csdp: for computing Lovász theta-function of graphs'
            'coxeter: Coxeter groups implementation'
            'cryptominisat: SAT solver'
            'cython: to compile cython code'
            'dot2tex: for displaying some diagrams'
            'ffmpeg: to export animations to video'
            'imagemagick: to show animations'
            'jmol: alternative 3D plot engine'
            'jupyter-jsmol: alternative 3D plot engine in the Jupyter notebook'
            'lrs: Algorithms for linear reverse search used in game theory and for computing volume of polytopes'
            'latte-integrale: integral point count in polyhedra'
            'msolve: polynomial system solving via msolve'
            'plantri: for generating some classes of graphs'
            'python-cvxpy: interface for several convex optimization backends'
            'python-database-cubic-hecke: cubic Hecke algebras'
            'python-database-knotinfo: interface to the KnotInfo and LinkInfo databases'
            'python-igraph: igraph backend for graph theory'
            'python-jupymake: polymake backend for polyhedral computations'
            'python-phitigra: graph editor'
            'python-pkgconfig: to compile cython code'
            'python-pycosat: picosat SAT solver'
            'python-pynormaliz: Normaliz backend for polyhedral computations'
            'python-pyscipopt: SCIP mixed integer linear programming backend'
            'rubiks: Rubiks cube algorithms'
            'sage-notebook-exporter: convert flask notebooks to Jupyter'
            'sagemath-doc: HTML documentation'
            'shared_meataxe: faster matrix arithmetic over finite fields'
            'sirocco: for computing the fundamental group of the complement of a plane curve'
            'topcom: to compute triangulations of point configurations')
makedepends=(bliss
             boost
             coxeter
             cython
             git
             mcqd
             python-jinja
             python-pkgconfig
             shared_meataxe
             sirocco
             tdlib)
conflicts=(sagemath)
provides=(sagemath)
source=(git+https://github.com/sagemath/sage#branch=develop
        latte-count.patch
        sagemath-tdlib-0.9.patch)
sha256sums=('SKIP'
            '5cd2f88965d7ebab9dfab6f5c2040d363a4a5ae41230219cc7070b907381da5a'
            '56a83abecf2ff5a500442adc7a50abbb70006037dd39c39dcdb04b3ca9fb51e2')
_pkgs=(standard
       bliss
       coxeter3
       mcqd
       meataxe
       sirocco
       tdlib)

pkgver() {
  cd sage
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare(){
  cd sage

# use correct latte-count binary name
  patch -p1 -i ../latte-count.patch
# update to tdlib 0.9 (Fedora)
  patch -p1 -i ../sagemath-tdlib-0.9.patch

  ./bootstrap
}

build() {
  export SAGE_NUM_THREADS=10
  export PYTHONPATH="$PWD"/sage/pkgs/sage-setup

  for _pkg in ${_pkgs[@]}; do
    cd "$srcdir"/sage/pkgs/sagemath-$_pkg
    python setup.py build
  done
}

package() {
  for _pkg in ${_pkgs[@]}; do
    cd "$srcdir"/sage/pkgs/sagemath-$_pkg
    python setup.py install --root="$pkgdir" --optimize=1
  done

# fix symlinks to assets
  _pythonpath=`python -c "from sysconfig import get_path; print(get_path('platlib'))"`
  for _i in $(ls "$srcdir"/sage/src/sage/ext_data/notebook-ipython); do
    rm "$pkgdir"/usr/share/jupyter/kernels/sagemath/$_i
    ln -s $_pythonpath/sage/ext_data/notebook-ipython/$_i "$pkgdir"/usr/share/jupyter/kernels/sagemath/
  done

# adjust threejs version
  rm "$pkgdir"$_pythonpath/sage/ext_data/threejs/threejs-version.txt
  ln -s /usr/share/threejs-sage/version "$pkgdir"$_pythonpath/sage/ext_data/threejs/threejs-version.txt
}
