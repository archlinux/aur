# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas Dziedzic <gostrc at gmail dot com>
# Contributor: Osman Ugus <ugus11 at yahoo dot com>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>

pkgname=sagemath-git
pkgver=9.4.beta4.r0.g473cd41f19
pkgrel=1
pkgdesc='Open Source Mathematics Software, free alternative to Magma, Maple, Mathematica, and Matlab'
arch=(x86_64)
url='http://www.sagemath.org'
license=(GPL)
depends=(palp brial cliquer maxima-ecl gfan sympow nauty python-rpy2 python-fpylll python-psutil python-cypari2
  python-matplotlib python-scipy python-sympy python-networkx python-pplpy python-sphinx python-ipywidgets python-memory-allocator
  gap flintqs lcalc lrcalc arb eclib zn_poly gd python-cvxopt pynac linbox m4rie pari-galdata pari-seadata-small planarity rankwidth tachyon
  sage-data-combinatorial_designs sage-data-elliptic_curves sage-data-graphs sage-data-polytopes_db sage-data-conway_polynomials
  iml giac libhomfly libbraiding symmetrica threejs-sage)
optdepends=('cython: to compile cython code' 'python-pkgconfig: to compile cython code'
  'jmol: alternative 3D plot engine' 'jupyter-jsmol: alternative 3D plot engine in the Jupyter notebook'
  'sagemath-doc: HTML documentation' 'python-igraph: igraph backend for graph theory'
  'sage-numerical-backends-coin: COIN mixed integer linear programming backend'
  'sage-numerical-backends-gurobi: Gurobi mixed integer linear programming backend'
  'coin-or-csdp: for computing Lovász theta-function of graphs'
  'buckygen: for generating fullerene graphs' 'plantri: for generating some classes of graphs' 'benzene: for generating fusenes and benzenoids'
  'ffmpeg: to export animations to video' 'imagemagick: to show animations'
  'coxeter: Coxeter groups implementation'
  'rubiks: Rubiks cube algorithms'
  'lrs: Algorithms for linear reverse search used in game theory and for computing volume of polytopes'
  'python-pynormaliz: Normaliz backend for polyhedral computations'
  'latte-integrale: integral point count in polyhedra' 'python-jupymake: polymake backend for polyhedral computations'
  'shared_meataxe: faster matrix arithmetic over finite fields' 'openblas: faster linear algebra'
  'sirocco: for computing the fundamental group of the complement of a plane curve' 'primecount: faster prime_pi implementation'
  'dot2tex: for displaying some diagrams' 'cryptominisat5: SAT solver' 'python-pycosat: picosat SAT solver'
  'python-pip: to install optional packages with sage -pip' 'sage-notebook-exporter: convert flask notebooks to Jupyter')
makedepends=(cython boost ratpoints python-jinja sirocco mcqd coxeter bliss tdlib python-pkgconfig shared_meataxe primecount git)
conflicts=(sagemath)
provides=(sagemath)
source=(git://git.sagemath.org/sage.git#branch=develop
        sagemath-optional-packages.patch
        latte-count.patch
        test-optional.patch
        sagemath-lrcalc2.patch)
sha256sums=('SKIP'
            'c100a61c8dfade43bebc622a363abcb3d935a2f40958371ad87a9eb00689f8b0'
            '88e944f23c3b2391dc2e9f9be8e1131152d837dc8c829dfc714663869a272e81'
            'af984186f852d2847d770a18fb6822296c50a652dbf55a1ed59d27517c3d3ee4'
            '240ac4c29d96d56407a20e1b7f9846e342a7eb2bb4edd6e5c86b3b5a8ff462f9')

pkgver() {
  cd sage
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare(){
  cd sage

# Upstream patches
# Replace lrcalc.pyx with a wrapper over lrcalc's python bindings https://trac.sagemath.org/ticket/31355
  patch -p1 -i ../sagemath-lrcalc2.patch

# Arch-specific patches
# assume all optional packages are installed
  patch -p1 -i ../sagemath-optional-packages.patch
# don't list optional packages when running tests
  patch -p1 -i ../test-optional.patch
# use correct latte-count binary name
  patch -p1 -i ../latte-count.patch

  cd build/pkgs/sagelib
  ./bootstrap
}

build() {
  cd sage/build/pkgs/sagelib/src

  export SAGE_NUM_THREADS=10
  python setup.py build
}

package() {
  cd sage/build/pkgs/sagelib/src

  python setup.py install --root="$pkgdir" --optimize=1

# Remove sage_setup
  rm -r "$pkgdir"/usr/lib/python*/site-packages/sage_setup

# fix symlinks to assets
  _pythonpath=`python -c "from sysconfig import get_path; print(get_path('platlib'))"`
  for _i in $(ls "$srcdir"/sage/src/sage/ext_data/notebook-ipython); do
    rm "$pkgdir"/usr/share/jupyter/kernels/sagemath/$_i
    ln -s $_pythonpath/sage/ext_data/notebook-ipython/$_i "$pkgdir"/usr/share/jupyter/kernels/sagemath/
  done
}
