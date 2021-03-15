# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas Dziedzic <gostrc at gmail dot com>
# Contributor: Osman Ugus <ugus11 at yahoo dot com>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>

pkgbase=sagemath-git
pkgname=(sagemath-git sagemath-jupyter-git)
pkgver=9.3.beta9.r0.g5cb72aade9
pkgrel=1
pkgdesc="Open Source Mathematics Software, free alternative to Magma, Maple, Mathematica, and Matlab"
arch=(x86_64)
url="http://www.sagemath.org"
license=(GPL)
depends=(ipython palp brial cliquer maxima-ecl gfan sympow nauty python-rpy2 python-fpylll python-psutil python-cypari2
  python-matplotlib python-scipy python-sympy python-networkx python-pillow python-pplpy python-sphinx
  gap flintqs lcalc lrcalc arb eclib zn_poly gd python-cvxopt pynac linbox m4rie pari-galdata pari-seadata-small planarity rankwidth tachyon
  sage-data-combinatorial_designs sage-data-elliptic_curves sage-data-graphs sage-data-polytopes_db sage-data-conway_polynomials
  iml libgiac libhomfly libbraiding symmetrica threejs-sage)
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
        sagemath-singular-4.2.patch
        sagemath-pari-2.13.patch
        sagemath-lrcalc2.patch
        sagemath-eclib-20210310.patch)
sha256sums=('SKIP'
            '4fdf318ec9a54567877b93af8c668ad925f2a82370048db158d134b58b064204'
            'af922e1f978821a9a1f6c9a56130d71e5011c84a7aee7bf66a591bee658af30b'
            '7da0dbcda15a327c21dc33853cb8f98cb86a283139f8735e3b20a71d49458a88'
            '9896486aae7c9903012275bb53980049382424457e7edb2ebf9b186e23135bcc'
            '33907a0681900b9580b8aa5b3d2ddb2d609977076c38fdbc47279ecef4104ed1'
            '240ac4c29d96d56407a20e1b7f9846e342a7eb2bb4edd6e5c86b3b5a8ff462f9'
            'a79f1165fd262fcb52ac7a6afc33aa8d75182fa16595aa9ba1aaa0b2ebb45c19')

pkgver() {
  cd sage
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare(){
  cd sage

# Upstream patches
# Fixes for singular 4.2 https://trac.sagemath.org/ticket/25993
  patch -p1 -i ../sagemath-singular-4.2.patch
# Port to PARI 2.13 https://trac.sagemath.org/ticket/30801
  patch -p1 -i ../sagemath-pari-2.13.patch
# Replace lrcalc.pyx with a wrapper over lrcalc's python bindings https://trac.sagemath.org/ticket/31355
  patch -p1 -i ../sagemath-lrcalc2.patch
# Fix build with eclib 20210310 https://trac.sagemath.org/ticket/31443
  patch -p1 -i ../sagemath-eclib-20210310.patch

# Arch-specific patches
# assume all optional packages are installed
  patch -p1 -i ../sagemath-optional-packages.patch
# don't list optional packages when running tests
  patch -p1 -i ../test-optional.patch
# use correct latte-count binary name
  patch -p1 -i ../latte-count.patch
}

build() {
  cd sage/build/pkgs/sagelib/src

  export SAGE_NUM_THREADS=10
  python setup.py build
}

package_sagemath-git() {
  optdepends+=('sagemath-jupyter-git: Jupyter kernel')
  conflicts=(sagemath)
  provides=(sagemath)

  cd sage/build/pkgs/sagelib/src
  python setup.py install --root="$pkgdir" --optimize=1

# Remove sage_setup
  rm -r "$pkgdir"/usr/lib/python*/site-packages/sage_setup
# Split jupyter kernel
  rm -r "$pkgdir"/usr/share
}

package_sagemath-jupyter-git() {
  pkgdesc='Jupyter kernel for SageMath'
  depends=(sagemath python-jupyter_client python-ipywidgets jupyter-jsmol)
  optdepends=('sage-notebook-exporter: convert flask notebooks to Jupyter')

  cd sage/src

  python -c "from sage.repl.ipython_kernel.install import SageKernelSpec; SageKernelSpec.update(prefix='$pkgdir/usr')"
# fix symlinks to assets
  _pythonpath=`python -c "from sysconfig import get_path; print(get_path('platlib'))"`
  for _i in $(ls sage/ext_data/notebook-ipython); do
    rm "$pkgdir"/usr/share/jupyter/kernels/sagemath/$_i
    ln -s $_pythonpath/sage/ext_data/notebook-ipython/$_i "$pkgdir"/usr/share/jupyter/kernels/sagemath/
  done
}
