# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas Dziedzic <gostrc at gmail dot com>
# Contributor: Osman Ugus <ugus11 at yahoo dot com>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>

pkgbase=sagemath-git
pkgname=(sagemath-git sagemath-jupyter-git)
pkgver=9.1.beta8.r0.gbe1e22c441
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
        sagemath-ipython7.patch
        sagemath-python-3.8.patch
        sagemath-pexpect-4.8.patch
        sagemath-gap-4.11.patch
        sagemath-matplotlib-3.2.patch
        sagemath-pari-2.11.3.patch)
sha256sums=('SKIP'
            '9cbb72a1422416152cedd6849944d3c02a1639642758b470931f9fc5ddf42d22'
            '6a5470d7044a50a35a6478f57c19adf72fe54aefebeea8a095915b63f9e219ac'
            '876fd1c0fc3471b56e54d960d79e5ce1d5fc49cebf6eed27043a7380854c792c'
            '937074fa7a8a4e2aba9ea77ec622fe937985a1a9176c48460d51325ee877a4f5'
            '454de1f9021230a4dda7ab52af3136f95708454d477e46209e39237530649ea9'
            'e44bbde87f3312548faad75b7383ef21fade55be251ab5804de41cd3842ca8a0'
            '42beceb0d5fc8580b55ccaf5229cd43d237897139d01b1b9e9d5b0dee135c2bb'
            'f812e32718eab0292d726bed386217524dcdae3d4078ce82c66c20d00b9806f7'
            '5e6d1aa34959bd4369bd08a80648a5c7bc2d38e72c97e9a5f986e91f8a7aca07'
            'd75f551fd942963b0158f5b25cefbecb213c37549375dd2e0f88e1856555fa1e'
            '979777363001cca87f73128dd4db5f372fc9e4f1079805a20af01df47797468f'
            'e9c450a30c3f76b05808ece2f40b86f5222cd39563fe7d901712937df28eb4ee')

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
# Fix warnings with matplotlib 3.2
  patch -p1 -i ../sagemath-matplotlib-3.2.patch
# Fix doctests with pari 2.11.3
  patch -p1 -i ../sagemath-pari-2.11.3.patch

# Upstream patches  
# use Features to detect Cremona databases https://trac.sagemath.org/ticket/25825
  patch -p1 -i ../sagemath-cremona.patch
# Fixes for singular 4.1.2 https://trac.sagemath.org/ticket/25993
  patch -p1 -i ../sagemath-singular-4.1.2.patch
# Fix SIGFPE crashes with ecl 16.1.3 https://trac.sagemath.org/ticket/22191
  patch -p1 -i ../sagemath-ecl-sigfpe.patch

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
  rm -r "$pkgdir"/usr/share/jupyter
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
