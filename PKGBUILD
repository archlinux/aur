# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas Dziedzic <gostrc at gmail dot com>
# Contributor: Osman Ugus <ugus11 at yahoo dot com>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>

pkgbase=sagemath-git
pkgname=(sagemath-git sagemath-jupyter-git)
pkgver=9.2.beta0.r0.g860e4dc988
pkgrel=1
pkgdesc="Open Source Mathematics Software, free alternative to Magma, Maple, Mathematica, and Matlab"
arch=(x86_64)
url="http://www.sagemath.org"
license=(GPL)
depends=(ipython palp brial cliquer maxima-ecl gfan sympow nauty python-rpy2 python-fpylll python-psutil python-cypari2
  python-matplotlib python-scipy python-sympy python-networkx python-pillow python-pplpy python-future python-sphinx
  gap flintqs lcalc lrcalc arb eclib zn_poly gd python-cvxopt pynac linbox m4rie rubiks pari-galdata pari-seadata-small planarity rankwidth tachyon
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
  'lrs: Algorithms for linear reverse search used in game theory and for computing volume of polytopes'
  'python-pynormaliz: Normaliz backend for polyhedral computations'
  'latte-integrale: integral point count in polyhedra' 'python-jupymake: polymake backend for polyhedral computations'
  'shared_meataxe: faster matrix arithmetic over finite fields' 'openblas: faster linear algebra'
  'sirocco: for computing the fundamental group of the complement of a plane curve' 'primecount: faster prime_pi implementation'
  'dot2tex: for displaying some diagrams' 'cryptominisat5: SAT solver' 'python-pycosat: picosat SAT solver'
  'python-pip: to install optional packages with sage -pip')
makedepends=(cython boost ratpoints python-jinja sirocco mcqd coxeter bliss tdlib python-pkgconfig shared_meataxe primecount git)
source=(git://git.sagemath.org/sage.git#branch=develop
        package.patch
        latte-count.patch
        test-optional.patch
        sagemath-cremona.patch
        sagemath-singular-4.1.2.patch
        sagemath-ecl-sigfpe.patch
        sagemath-no-dict-sorting.patch
        sagemath-ipython7.patch
        sagemath-python-3.8.patch
        sagemath-pexpect-4.8.patch
        sagemath-gap-4.11.patch
        sagemath-matplotlib-3.2.patch
        sagemath-pari-2.11.3.patch
        sagemath-jedi-0.16.patch
        sagemath-sphinx-3.patch
        sagemath-sympy-1.6.patch)
sha256sums=('SKIP'
            '5034676c4ce46181723f261d6bd180a795adea417f485c5e3e361b3aaef498ec'
            'd6d8dd7d75e29a9ddbbb0da6fe18f86ee3ff49aad4af71104da38a8fa0d4c3db'
            '77aa8e99aae5da74a9486f01b603a0b5d224c3d13e9d9fab681fb71a6af149f1'
            '937074fa7a8a4e2aba9ea77ec622fe937985a1a9176c48460d51325ee877a4f5'
            '1a98d031b896eebdbcb61f2f5d9bc8b5edbe766aac6d6cc2ff2e1fb736b5c098'
            'e44bbde87f3312548faad75b7383ef21fade55be251ab5804de41cd3842ca8a0'
            'f9721c66d1a0267bb19923f5084d40f8121fcada6db1d1c37484dab70b655544'
            'b2a7055bc380c1d86a9514540d985fc4bce3cea1ea865e13642f11b1bf0f6e50'
            '312cfbaa9e39bd0184cdee775d7225992d8a23ae72df03709c78d4ebcf8d3ed6'
            '5e6d1aa34959bd4369bd08a80648a5c7bc2d38e72c97e9a5f986e91f8a7aca07'
            'f6b3f52748d0f692f109c29724b402149b74960d8954e244ab770c85af832b6c'
            'fea8674782a398ead1b065e0d4b551be4e268c15fa336b91b9bb7e738163eaed'
            '688345dd88174cc82a196a9ecace86f3b4f28bb2fae2d7196a40a76ff724f92e'
            'b15762a283b2dade0d5131c7b22b33f47bcbc1eca4975b1e00d85fa152299503'
            'c9fa4f136a8e4fa9832524bb0ee4a7fbb3c6e992595a3b10c7c627ba9161b4ce'
            'ade7f86abc8b04b6a01c1a495b644a034d27bacdfdfa62813f4f8945bb96a8fe')

pkgver() {
  cd sage
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare(){
  cd sage

# Arch-specific patches
# assume all optional packages are installed
  patch -p0 -i ../package.patch
# don't list optional packages when running tests
  patch -p0 -i ../test-optional.patch
# use correct latte-count binary name
  patch -p1 -i ../latte-count.patch
# Python 3.8 support
  patch -p1 -i ../sagemath-python-3.8.patch
# Fix expect_peek with pexpect 4.8
  patch -p1 -i ../sagemath-pexpect-4.8.patch
# Support IPython 7
  patch -p1 -i ../sagemath-ipython7.patch
# Fix mathjax path
  sed -e 's|mathjax|mathjax2|g' -i src/sage/env.py
# Fix gap.version() and doctests with GAP 4.11
  patch -p1 -i ../sagemath-gap-4.11.patch
# Fix doctests with pari 2.11.3
  patch -p1 -i ../sagemath-pari-2.11.3.patch
# Fix deprecation warnings on autocompletion with jedi 0.16
  patch -p1 -i ../sagemath-jedi-0.16.patch

# Upstream patches  
# use Features to detect Cremona databases https://trac.sagemath.org/ticket/25825
  patch -p1 -i ../sagemath-cremona.patch
# Fixes for singular 4.1.2 https://trac.sagemath.org/ticket/25993
  patch -p1 -i ../sagemath-singular-4.1.2.patch
# Fix SIGFPE crashes with ecl 16.1.3 https://trac.sagemath.org/ticket/22191
  patch -p1 -i ../sagemath-ecl-sigfpe.patch
# Fix doc build with sphinx 3 https://trac.sagemath.org/ticket/28856
  patch -p1 -i ../sagemath-sphinx-3.patch
# Fix warnings with matplotlib 3.2 https://trac.sagemath.org/ticket/29547
  patch -p1 -i ../sagemath-matplotlib-3.2.patch
# Port to sympy 1.6 changes https://trac.sagemath.org/ticket/29730
  patch -p1 -i ../sagemath-sympy-1.6.patch
# Sort dicts in doctests https://trac.sagemath.org/ticket/29042
  patch -p1 -i ../sagemath-no-dict-sorting.patch

  sed -e 's|sage-python23|python|' -i src/bin/*
  sed -e 's|$SAGE_PYTHON3|yes|' -i src/bin/sage
}

build() {
  cd sage/src

  export CC=gcc \
         SAGE_ROOT="$PWD" \
         SAGE_SRC="$PWD" \
         SAGE_NUM_THREADS=10
  python setup.py build
}

package_sagemath-git() {
  optdepends+=('sagemath-jupyter-git: Jupyter kernel')
  conflicts=(sagemath)
  provides=(sagemath)

  cd sage/src

  export SAGE_ROOT="$PWD" \
         SAGE_LOCAL="/usr"

  python setup.py install --root="$pkgdir" --optimize=1

  mkdir -p "$pkgdir"/usr/bin
  cp bin/{sage,math-readline} "$pkgdir"/usr/bin
  for _i in cachegrind callgrind cleaner coverage coverageall cython eval fixdoctests grep grepdoc inline-fortran ipynb2rst \
    ipython massif maxima.lisp native-execute notebook num-threads.py omega open preparse python run \
    run-cython runtests startuptime.py valgrind version.sh
  do
    cp bin/sage-$_i "$pkgdir"/usr/bin
  done
  
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
