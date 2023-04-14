# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas Dziedzic <gostrc at gmail dot com>
# Contributor: Osman Ugus <ugus11 at yahoo dot com>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>

pkgname=sagemath-git
pkgver=10.0.beta9.r0.g97b45d80a7
pkgrel=1
pkgdesc='Open Source Mathematics Software, free alternative to Magma, Maple, Mathematica, and Matlab'
arch=(x86_64)
url='http://www.sagemath.org'
license=(GPL)
depends=(palp brial cliquer maxima-fas gfan sympow nauty python-rpy2 python-fpylll python-cypari2
  python-matplotlib python-scipy python-sympy python-networkx python-pplpy python-sphinx python-ipywidgets python-memory-allocator
  gap lcalc lrcalc arb eclib gd python-cvxopt singular linbox m4rie pari-galdata pari-seadata-small planarity rankwidth tachyon
  sage-data-combinatorial_designs sage-data-elliptic_curves sage-data-graphs sage-data-polytopes_db sage-data-conway_polynomials
  iml giac libhomfly libbraiding symmetrica threejs-sage python-primecountpy)
optdepends=('cython: to compile cython code'
  'python-pkgconfig: to compile cython code'
  'jmol: alternative 3D plot engine'
  'jupyter-jsmol: alternative 3D plot engine in the Jupyter notebook'
  'sagemath-doc: HTML documentation'
  'python-igraph: igraph backend for graph theory'
  'bliss: bliss backend for graph theory'
  'sage-numerical-backends-coin: COIN mixed integer linear programming backend'
  'sage-numerical-backends-gurobi: Gurobi mixed integer linear programming backend'
  'python-pyscipopt: SCIP mixed integer linear programming backend'
  'coin-or-csdp: for computing Lovász theta-function of graphs'
  'buckygen: for generating fullerene graphs'
  'plantri: for generating some classes of graphs'
  'benzene: for generating fusenes and benzenoids'
  'ffmpeg: to export animations to video'
  'imagemagick: to show animations'
  'coxeter: Coxeter groups implementation'
  'rubiks: Rubiks cube algorithms'
  'lrs: Algorithms for linear reverse search used in game theory and for computing volume of polytopes'
  'python-pynormaliz: Normaliz backend for polyhedral computations'
  'latte-integrale: integral point count in polyhedra'
  'python-jupymake: polymake backend for polyhedral computations'
  'shared_meataxe: faster matrix arithmetic over finite fields'
  'openblas: faster linear algebra'
  'sirocco: for computing the fundamental group of the complement of a plane curve'
  'dot2tex: for displaying some diagrams'
  'cryptominisat5: SAT solver'
  'python-pycosat: picosat SAT solver'
  'python-pip: to install optional packages with sage -pip'
  'sage-notebook-exporter: convert flask notebooks to Jupyter'
  'python-database-knotinfo: interface to the KnotInfo and LinkInfo databases'
  'python-phitigra: graph editor'
  'topcom: to compute triangulations of point configurations'
  'python-database-cubic-hecke: cubic Hecke algebras'
  'msolve: polynomial system solving via msolve')
makedepends=(cython boost python-jinja sirocco mcqd coxeter bliss tdlib python-pkgconfig shared_meataxe git)
conflicts=(sagemath)
provides=(sagemath)
source=(git+https://github.com/sagemath/sage#branch=develop
        sagemath-optional-packages.patch
        latte-count.patch
        test-optional.patch
        sagemath-linbox-1.7.patch
        sagemath-bliss-0.77.patch
        sagemath-tdlib-0.9.patch)
sha256sums=('SKIP'
            '8a5b935d2fd8815489713db6497e9d44aefd61e8553e8cd4acc2cb1adf625ccc'
            'bd188af45ce31579b82407adee8e9bf6033a996f7ea6e328fabca526f31c08ba'
            '4484bd38b273e7fcc3d54bcd38e1ed3cdade12f3e9dc79235b011ef69e17c10c'
            'fbc87b62c73d20aa12fced28f5d68dc2b3ec7cc9123be424226321195bf2b3b4'
            '1a578528bab7be3970954fdfa033afa69fe753da1bab3f41693b0e05e3c849cd'
            '56a83abecf2ff5a500442adc7a50abbb70006037dd39c39dcdb04b3ca9fb51e2')

pkgver() {
  cd sage
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare(){
  cd sage

# Upstream patches
# Fix build with linbox 1.7 https://trac.sagemath.org/ticket/32959
  patch -p1 -i ../sagemath-linbox-1.7.patch
# Fix build with bliss 0.77 https://trac.sagemath.org/ticket/33010
  patch -p1 -i ../sagemath-bliss-0.77.patch

# Arch-specific patches
# assume all optional packages are installed
  patch -p1 -i ../sagemath-optional-packages.patch
# don't list optional packages when running tests
  patch -p1 -i ../test-optional.patch
# use correct latte-count binary name
  patch -p1 -i ../latte-count.patch
# update to tdlib 0.9 (Fedora)
  patch -p1 -i ../sagemath-tdlib-0.9.patch

  cd build/pkgs/sagelib
  ./bootstrap
}

build() {
  cd sage/pkgs/sagemath-standard

  export SAGE_NUM_THREADS=10
  export PYTHONPATH="$PWD"/../sage-setup
  python setup.py build
}

package() {
  cd sage/pkgs/sagemath-standard

  python setup.py install --root="$pkgdir" --optimize=1

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
