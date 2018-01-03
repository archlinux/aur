# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas Dziedzic <gostrc at gmail dot com>
# Contributor: Osman Ugus <ugus11 at yahoo dot com>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>
# Special thanks to Nareto for moving the compile from the .install to the PKGBUILD

pkgbase=sagemath-git
pkgname=(sagemath-git sagemath-jupyter-git)
pkgver=8.2.beta2.r0.ga1782046e2
pkgrel=1
pkgdesc="Open Source Mathematics Software, free alternative to Magma, Maple, Mathematica, and Matlab"
arch=(x86_64)
url="http://www.sagemath.org"
license=(GPL)
depends=(ipython2 ppl palp brial cliquer maxima-ecl gfan sympow nauty python2-rpy2 python2-fpylll python2-psutil python2-cypari2
  python2-matplotlib python2-scipy python2-sympy python2-networkx python2-pillow python2-future libgap flintqs lcalc lrcalc arb
  eclib gmp-ecm zn_poly gd python2-cvxopt pynac linbox rubiks pari-galdata pari-seadata-small planarity rankwidth tachyon
  sage-data-combinatorial_designs sage-data-elliptic_curves sage-data-graphs sage-data-polytopes_db sage-data-conway_polynomials)
optdepends=('cython2: to compile cython code' 'python2-pkgconfig: to compile cython code'
  'jmol: 3D plots' 'sage-notebook: Flask notebook interface (deprecated)'
  'sagemath-doc: Documentation and inline help' 'python2-igraph: igraph backend for graph theory'
  'coin-or-cbc: COIN backend for numerical computations' 'coin-or-csdp: for computing Lovász theta-function of graphs'
  'buckygen: for generating fullerene graphs' 'plantri: for generating some classes of graphs' 'benzene: for generating fusenes and benzenoids'
  'ffmpeg: to export animations to video' 'imagemagick: to show animations'
  'coxeter3: Coxeter groups implementation' 'cryptominisat5: SAT solver' 'gap-data: for computing Galois groups'
  'lrs: Algorithms for linear reverse search used in game theory and for computing volume of polytopes'
  'libhomfly: for computing the homfly polynomial of links' 'libbraiding: for computing in braid groups'
  'libfes: exhaustive search of solutions for boolean equations' 'python2-pynormaliz: Normaliz backend for polyhedral computations'
  'latte-integrale: integral point count in polyhedra' 'polymake: polymake backend for polyhedral computations'
  'meataxe: faster matrix arithmetic over finite fields'
  'sirocco: for computing the fundamental group of the complement of a plane curve'
  'three.js: alternative 3D plots engine')
makedepends=(cython2 boost ratpoints symmetrica python2-jinja coin-or-cbc libhomfly libbraiding sirocco
  mcqd coxeter3 bliss-graphs tdlib python2-pkgconfig meataxe libfes git)
source=(git://git.sagemath.org/sage.git#branch=develop
        sagemath-env.patch package.patch latte-count.patch jupyter-path.patch sagemath-python3-notebook.patch test-optional.patch
        r-no-readline.patch fes02.patch sagemath-threejs.patch pari-stackwarn.patch
        sagemath-detect-igraph.patch sagemath-networkx2.patch sagemath-matplotlib2.patch sagemath-scipy-1.0.patch sagemath-lrs.patch)
sha256sums=('SKIP'
            '39b76a189365464998cab9355d177581bc2b15dff10858f316faa85f2efa0426'
            'c41ae665499c6cd775d40bbe178f8786830b0931ee26bf11ee02f7d83bcc8107'
            '0b680e674c11c47afa86162d8b49645620b8912722e08133d23357c29ca9310a'
            '2cad308f8adbb6c54e6603fa22b2f0eb60f6f09248d5d015000c3932ac14f646'
            '962ce805c87147212b21fc2ab0ac9af9bd0033942c7a6905b9906645b48e8a4f'
            'ef94908d4ab28d13af622e6e58ec191aa78817d17e4466c7bb6f64ee72a813b9'
            'afd0952b9bb8f52fd428eae36cf719a58ff85a894baae88cbb2124e043768cc7'
            '7fcb52e96935dccb0f958d37c2f4e3918392480b9af53e08562f6cba6c68cb94'
            '514135b920a43f999571a15e97b41e14f5bed59f65b19643864dc23555a7b830'
            'bfd2a20a33ab19a8a8b216a77d07f62e809fe1e1879c4f171ce5dca62fd482e9'
            '28d7789b8d777922ab8871ca43b6afab751428cae875c0343d3962e6a2030b88'
            '1024f3a6a9a1a6ae96d9962bb7d1f5842f4a4a5ff5098afad81a60188b7d5160'
            'b9ab2bb5f381ea425e8763b81b8b3a108a3951c594fb1f37f7df921e7c77e26d'
            '17397b8e1843b013ef5d2e083369109f0719651edd8ef0c8493cb49e2bc4324a'
            'c0f65534a845ba802de6196229159fe67fcc3f72f0cb1ce57d4ae5c9fe10282c')

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
  patch -p0 -i ../sagemath-env.patch
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
# fix python-igraph detection
  patch -p1 -i ../sagemath-detect-igraph.patch
# fix lrs detection
  patch -p1 -i ../sagemath-lrs.patch
# adapt to networkx 2 changes
  patch -p1 -i ../sagemath-networkx2.patch
# fix three.js plotting backend
  patch -p1 -i ../sagemath-threejs.patch
# don't show PARI stack size increase warnings during doctesting (Debian)
  patch -p1 -i ../pari-stackwarn.patch
# remove deprecated scipy parameters
  patch -p1 -i ../sagemath-scipy-1.0.patch

# Upstream patches  
# fix build against libfes 0.2 http://trac.sagemath.org/ticket/15209
  patch -p1 -i ../fes02.patch
# port away from deprecated and removed functions in matplotlib 2 https://trac.sagemath.org/ticket/23696
  patch -p1 -i ../sagemath-matplotlib2.patch

# use python2
  sed -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|' -e 's|exec python|exec python2|' -i src/bin/*
  sed -e 's|cython {OPT}|cython2 {OPT}|' -e 's|python setup.py|python2 setup.py|' -i src/sage/misc/cython.py
  sed -e 's|exec ipython|exec ipython2|' -e 's|cygdb|cygdb2|g' -i src/bin/sage
  sed -e "s|'cython'|'cython2'|" -i src/bin/sage-cython
  sed -e 's|bin/python|bin/python2|g' -i src/bin/sage-env
}

build() {
  cd sage
  autoreconf -vi
  ./configure --prefix=/usr || true

  cd src

  export SAGE_ROOT="$PWD"
  export SAGE_SRC="$PWD"

  python2 setup.py build
}

package_sagemath-git() {
  optdepends+=('sagemath-jupyter: Jupyter kernel')
  conflicts=(sagemath)
  provides=(sagemath)

  cd sage/src

  export SAGE_ROOT="$PWD"
  export SAGE_LOCAL="/usr"
  export JUPYTER_PATH="$pkgdir"/usr/share/jupyter

  python2 setup.py install --root="$pkgdir" --optimize=1

  mkdir -p "$pkgdir"/usr/bin
  cp bin/sage "$pkgdir"/usr/bin
  for _i in arch-env banner cachegrind callgrind cleaner coverage coverageall cython env env-config eval grep grepdoc inline-fortran \
    ipython massif maxima.lisp native-execute notebook num-threads.py omega open preparse python rst2sws rst2txt run \
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

  cd sage/src

  export SAGE_ROOT="$PWD"
  export SAGE_LOCAL="/usr"
  export JUPYTER_PATH="$pkgdir"/usr/share/jupyter

  python2 -c "from sage.repl.ipython_kernel.install import SageKernelSpec; SageKernelSpec.update()"
}
