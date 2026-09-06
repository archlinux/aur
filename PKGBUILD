# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas Dziedzic <gostrc at gmail dot com>
# Contributor: Osman Ugus <ugus11 at yahoo dot com>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>

pkgname=sagemath-git
pkgver=10.10.beta10.r0.g7ea6fe54adc
pkgrel=1
pkgdesc='Open Source Mathematics Software, free alternative to Magma, Maple, Mathematica, and Matlab'
arch=(x86_64)
url='http://www.sagemath.org'
license=(GPL-2.0-or-later)
depends=(brial
         cblas
         cliquer
         ecl
         eclib
         fflas-ffpack
         flint
         gap
         gd
         gfan
         givaro
         glibc
         glpk
         gmp
         gmp-ecm
         gsl
         highs
         iml
         ipython
         lcalc
         libbraiding
         libgcc
         libhomfly
         libmpc
         libstdc++
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
         python-conway-polynomials
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
         python-platformdirs
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
            'fricas: FriCAS interface'
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
            'python-khoca: for computing the Khovanov homology of knots'
            'python-matroid-database: matroids database'
            'python-phitigra: graph editor'
            'python-pkgconfig: to compile cython code'
            'python-pycosat: picosat SAT solver'
            'python-pynormaliz: Normaliz backend for polyhedral computations'
            'python-pyscipopt: SCIP mixed integer linear programming backend'
            'regina: some methods related to low-dimensional topology'
            'rubiks: Rubiks cube algorithms'
            'sage-data-cunningham_tables: list of prime numbers in the Cunningham table'
            'sagemath-doc: HTML documentation'
            'sagemath-giac: giac integration backend'
            'shared_meataxe: faster matrix arithmetic over finite fields'
            'sirocco: for computing the fundamental group of the complement of a plane curve'
            'snappy-manifolds: for some additional knot methods'
            'topcom: to compute triangulations of point configurations')
makedepends=(bliss
             boost
             coxeter
             cython
             git
             mcqd
             meson-python
             python-build
             python-installer
             python-jinja
             python-pkgconfig
             python-setuptools
             shared_meataxe
             sirocco
             treedec)
checkdepends=(python-pytest)
conflicts=(sagemath)
provides=(sagemath)
source=(git+https://github.com/sagemath/sage#branch=develop
        latte-count.patch
        cython-3.3.patch)
sha256sums=('SKIP'
            'c3aa0243de70fe9c58772c83e748510b7af6950f98d01b3a819e6f8d1232c797'
            '01d4ba96770db3cffb41d09ec40910ba09147cde26c745ac8b7bd80a957e1055')

pkgver() {
  cd sage
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare(){
  cd sage

# use correct latte-count binary name
  patch -p1 -i ../latte-count.patch
# fixes and workarounds for cython 3.3
  patch -p1 -i ../cython-3.3.patch
}

build() {
  cd sage
  python -m build --wheel --no-isolation \
    -C setup-args=-Dbuild-docs=false \
    -C setup-args=-Ddefer_feature_checks=true
}

check() {
  cd sage
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v
}

package() {
  cd sage
  python -m installer --destdir="$pkgdir" dist/*.whl

# adjust threejs version
  _pythonpath=`python -c "from sysconfig import get_path; print(get_path('platlib'))"`
  rm "$pkgdir"$_pythonpath/sage/ext_data/threejs/threejs-version.txt
  ln -s /usr/share/threejs-sage/version "$pkgdir"$_pythonpath/sage/ext_data/threejs/threejs-version.txt
}
