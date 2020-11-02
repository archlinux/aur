# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas Dziedzic <gostrc at gmail dot com>
# Contributor: Osman Ugus <ugus11 at yahoo dot com>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>

pkgbase=sagemath-git
pkgname=(sagemath-git sagemath-jupyter-git)
pkgver=9.3.beta0.r0.g2c87dc16f2
pkgrel=1
pkgdesc="Open Source Mathematics Software, free alternative to Magma, Maple, Mathematica, and Matlab"
arch=(x86_64)
url="http://www.sagemath.org"
license=(GPL)
depends=(ipython palp brial cliquer maxima-ecl gfan sympow nauty python-rpy2 python-fpylll python-psutil python-cypari2
  python-matplotlib python-scipy python-sympy python-networkx python-pillow python-pplpy python-sphinx
  gap flintqs lcalc lrcalc arb eclib zn_poly gd python-cvxopt pynac linbox m4rie pari-galdata pari-seadata-small planarity rankwidth tachyon
  sage-data-combinatorial_designs sage-data-elliptic_curves sage-data-graphs sage-data-polytopes_db sage-data-conway_polynomials
  iml libgiac libhomfly libbraiding symmetrica three.js)
optdepends=('cython: to compile cython code' 'python-pkgconfig: to compile cython code'
  'jmol: alternative 3D plot engine' 'sagemath-doc: HTML documentation' 'python-igraph: igraph backend for graph theory'
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
  'python-pip: to install optional packages with sage -pip')
makedepends=(cython boost ratpoints python-jinja sirocco mcqd coxeter bliss tdlib python-pkgconfig shared_meataxe primecount git)
source=(git://git.sagemath.org/sage.git#branch=develop
        sagemath-optional-packages.patch
        latte-count.patch
        test-optional.patch
        sagemath-singular-4.1.2.patch
        sagemath-gap-4.11.patch
        sagemath-flint-2.6.patch
        sagemath-cypari-2.1.2.patch
        sagemath-pari-2.13.patch)
sha256sums=('SKIP'
            '4fb46b12b5ee5e5bde87f646dc69a7b8929886be247e2d9a9ae1f12efbe5b580'
            'af922e1f978821a9a1f6c9a56130d71e5011c84a7aee7bf66a591bee658af30b'
            '7da0dbcda15a327c21dc33853cb8f98cb86a283139f8735e3b20a71d49458a88'
            '881186d016a6eb47b919765b9d4e6abc4560fce54e08cf42bd948ba77e16aa85'
            '34f06f9776f84f6998b1350555316e0ffea76ed16e149916970f19ef750a467f'
            '5d00b24c1d36b41b8ea3f07b93fc0e00b42dd84d9bc4e9b3d26e5f2cfeba6405'
            'dc507eeb75eae1109273879771b4eb56172b7417e87a0693381106afd7554e04'
            'a285ab97c4342c1d050db3493c03807a0162ced74a67bea9eb2794f52ce439fc')

pkgver() {
  cd sage
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare(){
  cd sage

  sed -e '/sage-env/d' -i src/setup.py # Don't try to install sage-env

# Upstream patches
# Fixes for singular 4.1.2 https://trac.sagemath.org/ticket/25993
  patch -p1 -i ../sagemath-singular-4.1.2.patch
# Fix segfault and tests with flint 2.6 https://trac.sagemath.org/ticket/29719
  patch -p1 -i ../sagemath-flint-2.6.patch
# Fix gap.version() and doctests with GAP 4.11 https://trac.sagemath.org/ticket/29314
  patch -p1 -i ../sagemath-gap-4.11.patch
# Fix gcd/lcm between pari and sage objects https://trac.sagemath.org/ticket/30849
  patch -p1 -i ../sagemath-cypari-2.1.2.patch
# Port to PARI 2.13 https://trac.sagemath.org/ticket/30801
  patch -p1 -i ../sagemath-pari-2.13.patch

# Arch-specific patches
# assume all optional packages are installed
  patch -p1 -i ../sagemath-optional-packages.patch
# don't list optional packages when running tests
  patch -p1 -i ../test-optional.patch
# use correct latte-count binary name
  patch -p1 -i ../latte-count.patch
# Fix mathjax path
  sed -e 's|mathjax|mathjax2|g' -i src/sage/env.py

  sed -e 's|sage-python23|python|' -i src/bin/*
  sed -e 's|$SAGE_PYTHON3|yes|' -i src/bin/sage
}

build() {
  cd sage/src

  export SAGE_NUM_THREADS=10
  python setup.py build
}

package_sagemath-git() {
  optdepends+=('sagemath-jupyter-git: Jupyter kernel')
  conflicts=(sagemath)
  provides=(sagemath)

  cd sage/src
  python setup.py install --root="$pkgdir" --optimize=1

  _pythonpath=`python -c "from sysconfig import get_path; print(get_path('platlib'))"`
# Remove sage_setup
  rm -r "$pkgdir"/$_pythonpath/sage_setup
# Install tests
  cp -r sage/doctest/tests "$pkgdir"/$_pythonpath/sage/doctest
  cp -r sage/tests/books "$pkgdir"/$_pythonpath/sage/tests

# Split jupyter kernel
  rm -r "$pkgdir"/usr/share
}

package_sagemath-jupyter-git() {
  pkgdesc='Jupyter kernel for SageMath'
  depends=(sagemath python-jupyter_client python-ipywidgets)
  optdepends=('sage-notebook-exporter: convert flask notebooks to Jupyter' 'jsmol: alternative 3D plot engine')

  cd sage/src

  export SAGE_ROOT="$PWD" \
         SAGE_LOCAL="/usr" \
         MATHJAX_DIR="/usr/share/mathjax2"
  python -c "from sage.repl.ipython_kernel.install import SageKernelSpec; SageKernelSpec.update(prefix='$pkgdir/usr')"
# fix symlinks to assets
  _pythonpath=`python -c "from sysconfig import get_path; print(get_path('platlib'))"`
  for _i in $(ls ext/notebook-ipython); do
    rm "$pkgdir"/usr/share/jupyter/kernels/sagemath/$_i
    ln -s $_pythonpath/sage/ext_data/notebook-ipython/$_i "$pkgdir"/usr/share/jupyter/kernels/sagemath/
  done
}
