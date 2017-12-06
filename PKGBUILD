# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas Dziedzic <gostrc at gmail dot com>
# Contributor: Osman Ugus <ugus11 at yahoo dot com>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>
# Special thanks to Nareto for moving the compile from the .install to the PKGBUILD

pkgbase=sagemath-git
pkgname=(sagemath-git sagemath-jupyter-git)
pkgver=8.1.rc3.r0.g20007d522c
pkgrel=1
pkgdesc="Open Source Mathematics Software, free alternative to Magma, Maple, Mathematica, and Matlab"
arch=(x86_64)
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
  'ffmpeg: to export animations to video' 'imagemagick: to show animations'
  'coxeter3: Coxeter groups implementation' 'cryptominisat5: SAT solver' 'gap-data: for computing Galois groups'
  'lrs: Algorithms for linear reverse search used in game theory and for computing volume of polytopes'
  'libhomfly: for computing the homfly polynomial of links' 'libbraiding: for computing in braid groups'
  'libfes: exhaustive search of solutions for boolean equations' 'python2-pynormaliz: Normaliz backend for polyhedral computations'
  'latte-integrale: integral point count in polyhedra' 'polymake: polymake backend for polyhedral computations'
  'meataxe: faster matrix arithmetic over finite fields'
  'sirocco: for computing the fundamental group of the complement of a plane curve'
  'three.js: alternative 3D plots engine' 'tachyon: alternative 3D plots engine')
makedepends=(cython2 boost ratpoints symmetrica python2-jinja coin-or-cbc libhomfly libbraiding sirocco
  mcqd coxeter3 bliss-graphs tdlib python2-pkgconfig meataxe libfes git)
source=(git://git.sagemath.org/sage.git#branch=develop
        env.patch package.patch latte-count.patch jupyter-path.patch sagemath-python3-notebook.patch test-optional.patch
        r-no-readline.patch fes02.patch sagemath-ecl-no-sigfpe.patch sagemath-threejs.patch
        sagemath-detect-igraph.patch sagemath-networkx2.patch sagemath-linbox-1.5.patch sagemath-pynac-0.7.14.patch)
sha256sums=('SKIP'
            '8c4ed4c1f3bb79fb279efa5267a78d0d093c718377b5aa0457b642e50f60811a'
            'c41ae665499c6cd775d40bbe178f8786830b0931ee26bf11ee02f7d83bcc8107'
            '0b680e674c11c47afa86162d8b49645620b8912722e08133d23357c29ca9310a'
            '2cad308f8adbb6c54e6603fa22b2f0eb60f6f09248d5d015000c3932ac14f646'
            '962ce805c87147212b21fc2ab0ac9af9bd0033942c7a6905b9906645b48e8a4f'
            'ef94908d4ab28d13af622e6e58ec191aa78817d17e4466c7bb6f64ee72a813b9'
            'afd0952b9bb8f52fd428eae36cf719a58ff85a894baae88cbb2124e043768cc7'
            '7fcb52e96935dccb0f958d37c2f4e3918392480b9af53e08562f6cba6c68cb94'
            'c31809f887bf9acc45c5bd9dd30bb93e73601d3efbf3016594c3c1d241731c8a'
            '514135b920a43f999571a15e97b41e14f5bed59f65b19643864dc23555a7b830'
            '28d7789b8d777922ab8871ca43b6afab751428cae875c0343d3962e6a2030b88'
            '37c5c1e694a2aca06c0f1c7d99622ff81fd2bc6a51e8745762294889fa4673f6'
            'a52d03e04c9d64bb957a1f8dcdae3280ebb9450a7fd76aaf5ae5de5c6f74774f'
            '538f7b279d72f4b67edb445d386d267f3f7022c1079031ca7ea06f6ce392c906')

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
# fix python-igraph detection
  patch -p1 -i ../sagemath-detect-igraph.patch
# adapt to networkx 2 changes
  patch -p1 -i ../sagemath-networkx2.patch
# fix three.js plotting backend
  patch -p1 -i ../sagemath-threejs.patch

# Upstream patches  
# fix build against libfes 0.2 http://trac.sagemath.org/ticket/15209
  patch -p1 -i ../fes02.patch
# disable SIGFPE for ecl https://trac.sagemath.org/ticket/22191
# patch -p1 -i ../sagemath-ecl-no-sigfpe.patch
# fix build with linbox 1.5 https://trac.sagemath.org/ticket/24214
  patch -p1 -i ../sagemath-linbox-1.5.patch
# fix build with pynac 0.7.14 https://trac.sagemath.org/ticket/24329
  patch -p1 -i ../sagemath-pynac-0.7.14.patch

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

  export SAGE_LOCAL="/usr"
  export SAGE_ROOT="$PWD"
  export SAGE_SRC="$PWD"

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
