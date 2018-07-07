# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas Dziedzic <gostrc at gmail dot com>
# Contributor: Osman Ugus <ugus11 at yahoo dot com>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>
# Special thanks to Nareto for moving the compile from the .install to the PKGBUILD

pkgbase=sagemath-git
pkgname=(sagemath-git sagemath-jupyter-git)
pkgver=8.3.beta8.r0.g6bccacc656
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
  'coxeter: Coxeter groups implementation' 'cryptominisat5: SAT solver' 'gap-4.8-data: for computing Galois groups'
  'lrs: Algorithms for linear reverse search used in game theory and for computing volume of polytopes'
  'libhomfly: for computing the homfly polynomial of links' 'libbraiding: for computing in braid groups'
  'libfes: exhaustive search of solutions for boolean equations' 'python2-pynormaliz: Normaliz backend for polyhedral computations'
  'latte-integrale: integral point count in polyhedra' 'polymake: polymake backend for polyhedral computations'
  'shared_meataxe: faster matrix arithmetic over finite fields' 'openblas: faster linear algebra'
  'sirocco: for computing the fundamental group of the complement of a plane curve' 'primecount: faster prime_pi implementation'
  'three.js: alternative 3D plots engine' 'dot2tex: for displaying some diagrams')
makedepends=(cython2 boost ratpoints symmetrica python2-jinja coin-or-cbc libhomfly libbraiding sirocco
  mcqd coxeter bliss-graphs tdlib python2-pkgconfig shared_meataxe libfes primecount git)
source=(git://git.sagemath.org/sage.git#branch=develop
        sagemath-env.patch package.patch latte-count.patch sagemath-python3-notebook.patch test-optional.patch
        r-no-readline.patch fes02.patch sagemath-threejs.patch sagemath-ignore-warnings.patch sagemath-cremona.patch
        sagemath-scipy-1.0.patch sagemath-singular-4.1.1.patch sagemath-lcalc-c++11.patch sagemath-gap-4.8.patch
        pari-ratpoints.patch::"https://github.com/sagemath/sage/commit/83458400.patch")
sha256sums=('SKIP'
            '50992e8421595aee3fe84663cbc7417d8d010cbcc824851032f24930653c2950'
            '9e3c998e0ca8dcbf7ad9f5a8d591f2bc4cb792be14708e064594046081e9b60d'
            '0b680e674c11c47afa86162d8b49645620b8912722e08133d23357c29ca9310a'
            '962ce805c87147212b21fc2ab0ac9af9bd0033942c7a6905b9906645b48e8a4f'
            '18edeafb01cc1ed7270c2dfb41a58717918680c98e8eada1858736acd65d92ba'
            'afd0952b9bb8f52fd428eae36cf719a58ff85a894baae88cbb2124e043768cc7'
            '7fcb52e96935dccb0f958d37c2f4e3918392480b9af53e08562f6cba6c68cb94'
            '2d13b15ad2d1511bb3d752a261497060a8901882b1c2fa9813219781b7a71d83'
            'a4a6c87b46ff23b89608aca66d00427334502e8bfb5dfe68b94497d19be1c7ae'
            '71cc42d168545d460bc7f67a30486ff1534093e2b4deeb83deda8ff5bd081e7b'
            '17397b8e1843b013ef5d2e083369109f0719651edd8ef0c8493cb49e2bc4324a'
            '11a68f156647ba9f38cb01b2a5e4f9a6a78f6297f2a5a65fbfdfe32d4be69d0c'
            '5114c912f821900e5bfae1e2cfeb7984de946d0b23e1182b0bf15be1d803dfd0'
            '6917cb74e50ae965ea8d7c39577e5f0a5068e4b6a67b53fc6f219149a7d06584'
            'e24ad879f6b2eb970778fc5e867bcbe0a6d393feca8f11f5cb8d07da1f024be9')

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
# fix freezes in R interface with readline 7 (Debian)
  patch -p1 -i ../r-no-readline.patch
# use correct latte-count binary name
  patch -p1 -i ../latte-count.patch
# make 'sage -notebook=jupyter' work with our python3 jupyter-notebook package
  patch -p1 -i ../sagemath-python3-notebook.patch
# fix three.js plotting backend
  patch -p1 -i ../sagemath-threejs.patch
# don't show PARI stack size increase or GLPK warnings during doctesting (Debian)
  patch -p1 -i ../sagemath-ignore-warnings.patch
# remove deprecated scipy parameters
  patch -p1 -i ../sagemath-scipy-1.0.patch
# fix build with Singular 4.1.1
  patch -p1 -i ../sagemath-singular-4.1.1.patch
# revert usage of development PARI features
  patch -Rp1 -i ../pari-ratpoints.patch
# don't force c++98 for lcalc (fixes build with NTL 11)
  patch -p1 -i ../sagemath-lcalc-c++11.patch
# Adjust paths for gap-4.8
  patch -p1 -i ../sagemath-gap-4.8.patch

# Upstream patches  
# fix build against libfes 0.2 http://trac.sagemath.org/ticket/15209
  patch -p1 -i ../fes02.patch
# use Features to detect Cremona databases https://trac.sagemath.org/ticket/24718
  patch -p1 -i ../sagemath-cremona.patch

# use python2
  sed -e 's|#!/usr/bin/env sage-python23|#!/usr/bin/env python2|' -e 's|#!/usr/bin/env python\b|#!/usr/bin/env python2|' -i src/bin/*
  sed -e 's|cython {OPT}|cython2 {OPT}|' -e 's|python setup.py|python2 setup.py|' -i src/sage/misc/cython.py
  sed -e 's|exec ipython\b|exec ipython2|' -e 's|cygdb|cygdb2|g' -i src/bin/sage
  sed -e "s|'cython'|'cython2'|" -i src/bin/sage-cython
}

build() {
  cd sage/src

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
  export SAGE_EXTCODE="$PWD"/ext

  python2 setup.py install --root="$pkgdir" --optimize=1

  mkdir -p "$pkgdir"/usr/bin
  cp bin/sage "$pkgdir"/usr/bin
  for _i in cachegrind callgrind cleaner coverage coverageall cython env eval grep grepdoc inline-fortran \
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

  python2 -c "from sage.repl.ipython_kernel.install import SageKernelSpec; SageKernelSpec.update(prefix='$pkgdir/usr')"
# fix symlinks to assets
  for _i in $(ls ext/notebook-ipython); do
    rm "$pkgdir"/usr/share/jupyter/kernels/sagemath/$_i
    ln -s /usr/share/sage/ext/notebook-ipython/$_i "$pkgdir"/usr/share/jupyter/kernels/sagemath/
  done
}
