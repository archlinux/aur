# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas Dziedzic <gostrc at gmail dot com>
# Contributor: Osman Ugus <ugus11 at yahoo dot com>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>

pkgname=sagemath-git
pkgver=9.8.beta6.r0.g2114066f877
pkgrel=1
pkgdesc='Open Source Mathematics Software, free alternative to Magma, Maple, Mathematica, and Matlab'
arch=(x86_64)
url='http://www.sagemath.org'
license=(GPL)
depends=(palp brial cliquer maxima-fas gfan sympow nauty python-rpy2 python-fpylll python-cypari2
  python-matplotlib python-scipy python-sympy python-networkx python-pplpy python-sphinx python-ipywidgets python-memory-allocator
  gap flintqs lcalc lrcalc arb eclib gd python-cvxopt singular linbox m4rie pari-galdata pari-seadata-small planarity rankwidth tachyon
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
  'python-database-cubic-hecke: cubic Hecke algebras')
makedepends=(cython boost python-jinja sirocco mcqd coxeter bliss tdlib python-pkgconfig shared_meataxe git)
conflicts=(sagemath)
provides=(sagemath)
source=(git://git.sagemath.org/sage.git#branch=develop
        sagemath-optional-packages.patch
        latte-count.patch
        test-optional.patch
        sagemath-linbox-1.7.patch
        sagemath-bliss-0.77.patch
        sagemath-tachyon-0.99.patch
        sagemath-gap-4.12.patch
        sagemath-tdlib-0.9.patch
        sagemath-pari-2.15.patch
        sagemath-singular-4.3.1.p3.patch)
sha256sums=('SKIP'
            'e54bc8f9c08773e8bc72e068eba97e0095c5fc0af44f7cc19ec0f3564c0fba3d'
            'bd188af45ce31579b82407adee8e9bf6033a996f7ea6e328fabca526f31c08ba'
            '9d042070df3dfd53a1248659677798da888f733548eda91a6d5169c7aa1907e1'
            'eacea27b214d32cb886a75695153dfc36b5bad2fd2517e8e4eee18e74220e9e3'
            '3e1f866944235b999d2d727ed1ced431bd67405b053701c21068607ec76f23c3'
            '9760db6c6ec40cc16ab8a0cbf3d019df7f6a69ff292e35622f282b7c888aac77'
            '89e9ade86131a5989ae2f2c2cee6a12f2c71df35d1ef7a84d6176dd3de0f2889'
            '56a83abecf2ff5a500442adc7a50abbb70006037dd39c39dcdb04b3ca9fb51e2'
            'f5a0258335dd4005c664a3c3d025c3d1df236abbffcfb6a66516f781c8c22526'
            'c3140d70efb0dc462c4acc9210332ce70f386c04f2c215245425dcf834515ba2')
options=(debug)

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
# Fix tests with tachyon 0.99 https://trac.sagemath.org/ticket/23712
  patch -p1 -i ../sagemath-tachyon-0.99.patch
# Port to GAP 4.12 https://trac.sagemath.org/ticket/34391
  patch -p1 -i ../sagemath-gap-4.12.patch
# Update to PARI 2.15 https://trac.sagemath.org/ticket/34537
  patch -p1 -i ../sagemath-pari-2.15.patch

# Arch-specific patches
# assume all optional packages are installed
  patch -p1 -i ../sagemath-optional-packages.patch
# don't list optional packages when running tests
  patch -p1 -i ../test-optional.patch
# use correct latte-count binary name
  patch -p1 -i ../latte-count.patch
# update to tdlib 0.9 (Fedora)
  patch -p1 -i ../sagemath-tdlib-0.9.patch
# fix build with singular 4.3.1.p3
  patch -p1 -i ../sagemath-singular-4.3.1.p3.patch

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
