# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas Dziedzic <gostrc at gmail dot com>
# Contributor: Osman Ugus <ugus11 at yahoo dot com>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>

pkgname=sagemath-git
pkgver=10.8.beta7.r0.g9f905404644
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
         gcc-libs
         gd
         gfan
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
            'python-matroid-database: matroids database'
            'python-phitigra: graph editor'
            'python-pkgconfig: to compile cython code'
            'python-pycosat: picosat SAT solver'
            'python-pynormaliz: Normaliz backend for polyhedral computations'
            'python-pyscipopt: SCIP mixed integer linear programming backend'
            'rubiks: Rubiks cube algorithms'
            'sage-data-cunningham_tables: list of prime numbers in the Cunningham table'
            'sagemath-doc: HTML documentation'
            'sagemath-giac: giac integration backend'
            'shared_meataxe: faster matrix arithmetic over finite fields'
            'sirocco: for computing the fundamental group of the complement of a plane curve'
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
        maxima-5.48.patch
        gap-4.15.patch)
sha256sums=('SKIP'
            'f1dd7fea298f38be0f03f46ed4bc9281267f03ec3eee2582edb385ca4cb5db09'
            '89d91fe14c980e0f6dd484fb90bc5a284449eb45faa8e14b23e6009e2630674e'
            'ebe01cd6d35072aeeea8c84909f4405eb0624227b4887fcea687a117d313f490')

pkgver() {
  cd sage
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare(){
  cd sage

# use correct latte-count binary name
  patch -p1 -i ../latte-count.patch
# adapt to maxima 5.48 changes
  patch -p1 -i ../maxima-5.48.patch
# fix tests with GAP 4.15
  patch -p1 -i ../gap-4.15.patch
}

build() {
  cd sage
  python -m build --wheel --no-isolation \
    -C setup-args=-Dbuild-docs=false
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
