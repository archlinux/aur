# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas Dziedzic <gostrc at gmail dot com>
# Contributor: Osman Ugus <ugus11 at yahoo dot com>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>

pkgname=sagemath-git
pkgver=9.5.beta8.r0.gd6d0edce10
pkgrel=1
pkgdesc='Open Source Mathematics Software, free alternative to Magma, Maple, Mathematica, and Matlab'
arch=(x86_64)
url='http://www.sagemath.org'
license=(GPL)
depends=(palp brial cliquer maxima-ecl gfan sympow nauty python-rpy2 python-fpylll python-cypari2
  python-matplotlib python-scipy python-sympy python-networkx python-pplpy python-sphinx python-ipywidgets python-memory-allocator
  gap flintqs lcalc lrcalc arb eclib zn_poly gd python-cvxopt singular linbox m4rie pari-galdata pari-seadata-small planarity rankwidth tachyon
  sage-data-combinatorial_designs sage-data-elliptic_curves sage-data-graphs sage-data-polytopes_db sage-data-conway_polynomials
  iml giac libhomfly libbraiding symmetrica threejs-sage primecount)
optdepends=('cython: to compile cython code'
  'python-pkgconfig: to compile cython code'
  'jmol: alternative 3D plot engine'
  'jupyter-jsmol: alternative 3D plot engine in the Jupyter notebook'
  'sagemath-doc: HTML documentation'
  'python-igraph: igraph backend for graph theory'
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
  'python-database-knotinfo: interface to the KnotInfo and LinkInfo databases')
makedepends=(cython boost ratpoints python-jinja sirocco mcqd coxeter bliss tdlib python-pkgconfig shared_meataxe git)
conflicts=(sagemath)
provides=(sagemath)
source=(git://git.sagemath.org/sage.git#branch=develop
        sagemath-optional-packages.patch
        latte-count.patch
        test-optional.patch
        sagemath-lrcalc2.patch
        sagemath-singular-4.2.1.p1.patch
        sagemath-linbox-1.7.patch
        sagemath-python3.10.patch)
sha256sums=('SKIP'
            'b2308f25c5e6ad330342fc365056d7aebfbba09b833e3be6fb6283061709b6a0'
            '2f310081357996b7d3bf813e63d07c0fc04d6724adbfbd1beeb554e9476e2e4c'
            'd1310321bf07491658e83087a6ddb0011738fa17a1dc3275d6d5c6907eaf3df8'
            'ede5e054c73eab9aa71285bb3a16c1f2f0e4fdc0d4645fe13912ff9489865bee'
            '1f0c44a4998ed239a3d77e3028b98b6f2c28a95e9bb4b8557523cc8f12ffba34'
            'eacea27b214d32cb886a75695153dfc36b5bad2fd2517e8e4eee18e74220e9e3'
            '602bf5ff69b81cb72123e9f0b1ce7df1cec0c15b97273e93691c1f11b20cd545'
            '93e563a167431357dde9b8948d3bfa2b7c17873013f80eed83d3c800f38bdcc2')
options=(debug !strip)

pkgver() {
  cd sage
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare(){
  cd sage

# Upstream patches
# Replace lrcalc.pyx with a wrapper over lrcalc's python bindings https://trac.sagemath.org/ticket/31355
  patch -p1 -i ../sagemath-lrcalc2.patch
# Fix build with singular 4.2.1.p1 https://trac.sagemath.org/ticket/32907
  patch -p1 -i ../sagemath-singular-4.2.1.p1.patch
# Fix build with linbox 1.7 https://trac.sagemath.org/ticket/32959
  patch -p1 -i ../sagemath-linbox-1.7.patch
# Fix tests with Python 3.10 https://trac.sagemath.org/ticket/30766
  patch -p1 -i ../sagemath-python3.10.patch

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
