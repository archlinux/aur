# Maintainer: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas Dziedzic <gostrc at gmail dot com>
# Contributor: Osman Ugus <ugus11 at yahoo dot com>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>
# Special thanks to Nareto for moving the compile from the .install to the PKGBUILD

pkgbase=sagemath-git
pkgname=(sagemath-git sagemath-jupyter-git)
pkgver=8.0.rc0.r0.g7de256c24f
pkgrel=1
pkgdesc="Open Source Mathematics Software, free alternative to Magma, Maple, Mathematica, and Matlab"
arch=(i686 x86_64)
url="http://www.sagemath.org"
license=(GPL)
depends=(ipython2 ppl palp brial cliquer maxima-ecl gfan sympow nauty python2-rpy2 python2-fpylll python2-psutil python2-cypari2
  python2-matplotlib python2-scipy python2-sympy python2-networkx python2-pillow python2-future libgap flintqs lcalc lrcalc arb
  eclib gmp-ecm zn_poly gd python2-cvxopt pynac linbox rubiks pari-galdata pari-seadata-small planarity rankwidth
  sage-data-combinatorial_designs sage-data-elliptic_curves sage-data-graphs sage-data-polytopes_db sage-data-conway_polynomials)
optdepends=('cython2: to compile cython code' 'python2-pkgconfig: to compile cython code'
  'jmol: 3D plots' 'sage-notebook: Flask notebook interface (deprecated)'
  'sagemath-doc: Documentation and inline help' 'python2-igraph: igraph backend for graph theory'
  'coin-or-cbc: COIN backend for numerical computations' 'coin-or-csdp: for computing Lovász theta-function of graphs'
  'buckygen: for generating fullerene graphs' 'plantri: for generating some classes of graphs' 'benzene: for generating fusenes and benzenoids'
  'modular_decomposition: modular decomposition of graphs' 'ffmpeg: to export animations to video' 'imagemagick: to show animations'
  'coxeter3: Coxeter groups implementation' 'cryptominisat5: SAT solver' 'gap-data: for computing Galois groups'
  'lrs: Algorithms for linear reverse search used in game theory and for computing volume of polytopes'
  'libhomfly: for computing the homfly polynomial of links' 'libbraiding: for computing in braid groups'
  'libfes: exhaustive search of solutions for boolean equations' 'python2-pynormaliz: Normaliz backend for polyhedral computations'
  'latte-integrale: integral point count in polyhedra' 'polymake: polymake backend for polyhedral computations'
  'sirocco: for computing the fundamental group of the complement of a plane curve'
  'three.js: alternative 3D plots engine' 'tachyon: alternative 3D plots engine')
makedepends=(cython2 boost ratpoints symmetrica python2-jinja coin-or-cbc libhomfly libbraiding sirocco
  mcqd coxeter3 modular_decomposition bliss-graphs tdlib python2-pkgconfig meataxe libfes git)
source=("git://git.sagemath.org/sage.git#branch=develop" 
        env.patch package.patch latte-count.patch
        jupyter-path.patch sagemath-python3-notebook.patch test-optional.patch r-no-readline.patch fes02.patch
        create_extension.patch include_dirs_from_externs.patch
        sagemath-ecl-no-sigfpe.patch)
sha256sums=('SKIP'
            'e0b5b8673300857fde823209a7e90faecf9e754ab812cc5e54297eddc0c79571'
            '4a2297e4d9d28f0b3a1f58e1b463e332affcb109eafde44837b1657e309c8212'
            'c6836783251d94c00f0229c1e671de86c58c6c6fb0f6959725317817abc64ca8'
            '889b65598d2a15e73eb482f543ec9b28d8992eeb57b07883c2e9627dfee15a9b'
            '27aa73d427d92aeb2c181a233aa3a574a4158cd7dee33832808f69edaec55ea2'
            '81d08c6a760f171f3381455b66a6c84789c9f0eefddbe6ca5794075514ad8c3a'
            'ef9f401fa84fe1772af9efee6816643534f2896da4c23b809937b19771bdfbbf'
            'a39da083c038ada797ffc5bedc9ba47455a3f77057d42f86484ae877ef9172ea'
            '362bd7603e14f729c87eebc9d3f56eb8a9ec94456038f0cb17591e81c459ef8e'
            '19603251870e308e824d130611d5211482bc5912579780a527748d7f8d2ef560'
            'c31809f887bf9acc45c5bd9dd30bb93e73601d3efbf3016594c3c1d241731c8a')

pkgver() {
  cd sage
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare(){
  cd sage

# Arch-specific patches
# assume all optional packages are installed
  patch -p0 -i ../package.patch
# set env variables
  patch -p0 -i ../env.patch
# don't list optional packages when running tests
  patch -p0 -i ../test-optional.patch
# set jupyter path
  patch -p0 -i ../jupyter-path.patch
# fix freezes in R interface with readline 7 (Debian)
  patch -p1 -i ../r-no-readline.patch
# use correct latte-count binary name
  patch -p1 -i ../latte-count.patch
# make 'sage -notebook=jupyter' work with our python3 jupyter-notebook package
  patch -p1 -i ../sagemath-python3-notebook.patch
# fix Cremona database detection
  sed -e "s|is_package_installed('database_cremona_ellcurve')|os.path.exists('/usr/share/cremona/cremona.db')|" \
   -i src/sage/databases/cremona.py

# Upstream patches  
# fix build against libfes 0.2 http://trac.sagemath.org/ticket/15209
  patch -p1 -i ../fes02.patch
# disable SIGFPE for ecl https://trac.sagemath.org/ticket/22191
  patch -p1 -i ../sagemath-ecl-no-sigfpe.patch

# use python2
  sed -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|' -e 's|exec python|exec python2|' -i src/bin/*
  sed -e 's|cython {OPT}|cython2 {OPT}|' -e 's|python setup.py|python2 setup.py|' -i src/sage/misc/cython.py
  sed -e 's|exec ipython|exec ipython2|' -e 's|cygdb|cygdb2|g' -i src/bin/sage
  sed -e "s|'cython'|'cython2'|" -i src/bin/sage-cython
  sed -e 's|bin/python|bin/python2|g' -i src/bin/sage-env

# Add necessary patches to cython
  mkdir -p local-python
  cp -r /usr/lib/python2.7/site-packages/{Cython,cython.*,pyximport} local-python
  cd local-python
  patch -p1 -i "$srcdir"/create_extension.patch
  patch -p1 -i "$srcdir"/include_dirs_from_externs.patch
}

build() {
  cd sage
  autoreconf -vi
  ./configure --prefix=/usr || true

  cd src
  export SAGE_LOCAL="/usr"
  export SAGE_ROOT="$PWD"
  export SAGE_SRC="$PWD"
  export CC=gcc
  export PYTHONPATH="$PWD"/../local-python

  python2 setup.py build
}

package_sagemath-git() {
  optdepends+=('sagemath-jupyter: Jupyter kernel')
  conflicts=(sage-mathematics sagemath)
  replaces=(sage-mathematics) 
  provides=(sage-mathematics sagemath)

  cd sage/src

  export SAGE_ROOT="$PWD"
  export SAGE_LOCAL="/usr"
  export JUPYTER_PATH="$pkgdir"/usr/share/jupyter

  python2 setup.py install --root="$pkgdir" --optimize=1

  mkdir -p "$pkgdir"/usr/bin
  cp bin/sage "$pkgdir"/usr/bin
  for _i in arch-env banner cachegrind callgrind cleaner coverage coverageall cython env env-config eval grep grepdoc inline-fortran \
    ipython massif maxima.lisp native-execute notebook num-threads.py omega open preparse python rst2ipynb rst2sws rst2txt run \
    run-cython runtests startuptime.py sws2rst valgrind version.sh
  do
    cp bin/sage-$_i "$pkgdir"/usr/bin
  done
  cp bin/math-readline "$pkgdir"/usr/bin
  
  mkdir -p "$pkgdir"/usr/share/sage
  cp -r ext "$pkgdir"/usr/share/sage
  
# Create SAGE_SRC, needed for the notebook and help
  mkdir "$pkgdir"/usr/share/sage/source
  ln -s /usr/share/doc/sage "$pkgdir"/usr/share/sage/source/doc

# Remove sage_setup
  rm -r "$pkgdir"/usr/lib/python2.7/site-packages/sage_setup

# Split jupyter kernel
  rm -r "$pkgdir"/usr/share/jupyter
}

package_sagemath-jupyter-git() {
  pkgdesc='Jupyter kernel for SageMath'
  depends=(sagemath python2-jupyter_client python2-ipywidgets mathjax)
  optdepends=('sage-notebook-exporter: convert flask notebooks to Jupyter')
  conflicts=(sagemath-jupyter)
  provides=(sagemath-jupyter)

  cd sage/src

  export SAGE_ROOT="$PWD"
  export SAGE_LOCAL="/usr"
  export JUPYTER_PATH="$pkgdir"/usr/share/jupyter

  python2 -c "from sage.repl.ipython_kernel.install import SageKernelSpec; SageKernelSpec.update()"
}
