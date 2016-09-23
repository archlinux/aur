# Maintainer: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas Dziedzic <gostrc at gmail dot com>
# Contributor: Osman Ugus <ugus11 at yahoo dot com>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>
# Special thanks to Nareto for moving the compile from the .install to the PKGBUILD

pkgname=sagemath-git
pkgver=7.4.beta5.r0.g0ae5fd8
pkgrel=1
pkgdesc="Open Source Mathematics Software, free alternative to Magma, Maple, Mathematica, and Matlab"
arch=(i686 x86_64)
url="http://www.sagemath.org"
license=(GPL)
depends=(ipython2 cysignals ppl palp brial singular cliquer maxima-ecl gfan sympow tachyon python2-rpy2 nauty
  python2-matplotlib python2-scipy python2-sympy python2-networkx python2-pillow libgap flintqs lcalc lrcalc arb
  eclib gmp-ecm zn_poly gd python2-cvxopt pynac linbox rubiks pari-galdata pari-seadata-small planarity rankwidth
  sage-data-combinatorial_designs sage-data-elliptic_curves sage-data-graphs sage-data-polytopes_db sage-data-conway_polynomials)
optdepends=('cython2: to compile cython code' 'python2-pkgconfig: to compile cython code'
  'jmol: 3D plots' 'sage-notebook: Browser-based (flask) notebook interface'
  'sagemath-doc: Documentation and inline help' 'ipython2-notebook: Jupyter notebook interface' 'mathjax: Jupyter notebook interface'
  'coin-or-cbc: COIN backend for numerical computations' 'coin-or-csdp: for computing Lovász theta-function of graphs'
  'buckygen: for generating fullerene graphs' 'plantri: for generating some classes of graphs' 'benzene: for generating fusenes and benzenoids'
  'modular_decomposition: modular decomposition of graphs' 'ffmpeg: to export animations to video' 'imagemagick: to show animations'
  'coxeter3: Coxeter groups implementation' 'cryptominisat: SAT solver' 'gap-data: for computing Galois groups'
  'lrs: Algorithms for linear reverse search used in game theory and for computing volume of polytopes'
  'libhomfly: for computing the homfly polynomial of links' 'libbraiding: for computing in braid groups'
  'python2-igraph: igraph backend for graph theory' 'sage-notebook-exporter: convert flask notebooks to jupyter'
  'jupyter-notebook: Jupyter notebook interface')
makedepends=(cython2 boost ratpoints symmetrica fflas-ffpack python2-jinja coin-or-cbc libhomfly libbraiding
  mcqd coxeter3 cryptominisat modular_decomposition bliss-graphs tdlib python2-pkgconfig meataxe) # libfes
conflicts=(sagemath)
provides=(sagemath sage-mathematics)
source=("git://git.sagemath.org/sage.git#branch=develop" 
        anal.h env.patch clean.patch skip-check.patch cython-sys-path.patch is-package-installed.patch package.patch
        disable-fes.patch jupyter-path.patch test-optional.patch python-2.7.11.patch ecm-7.patch
        increase-rtol.patch sagemath-singular4.patch)
md5sums=('SKIP'
         'a906a180d198186a39820b0a2f9a9c63'
         'ad5cb4a0f8daab9d12e13ff3f13e0589'
         '34fa3af30eca3cf554fc411d7c16cb3e'
         '17771a1e59e14535cc837a189d3cb8a7'
         '1fc960b3c64ed407a991ee26c222a689'
         '5dca842e4440e4ef235ae18c1b1f20e3'
         '9ba81f717ffd4e20b8b2f2a318307488'
         'a40b32a7b5d83379745b538be85064c8'
         'f3c2264ec392d717a82e61e53d085b73'
         'cdcabd475b80afe0534a5621e972736e'
         'ef927896f2071b442b1d07d7e69f5f3a'
         'e4a91dcedbc5e617919e5a9bf1310f24'
         '1db8db7bfed5f991d55ae11d810ff5cb'
         '1baa1f7f09ca0b2b18a8b7b440508d69')

pkgver() {
  cd sage
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}


prepare(){
  cd sage

# Arch-specific patches
# compile all optional extensions
  patch -p1 -i ../optional-extensions.patch
# find L.h header
  sed -e 's|libLfunction|Lfunction|' -i src/sage/libs/lcalc/lcalc_sage.h
# don't try to link against libpng 1.2
  sed -e 's|png12|png|' -i src/module_list.py
# set env variables
  patch -p0 -i ../env.patch
# don't try to remove installed files
  patch -p0 -i ../clean.patch
# skip checking build status
  patch -p0 -i ../skip-check.patch
# supress warning about GAP install dir
  sed -e "s|gapdir = os.path.join(SAGE_LOCAL, 'gap', 'latest')|gapdir = '/usr/lib/gap'|" -i src/sage/libs/gap/util.pyx 
# don't list optional packages when running tests
# patch -p0 -i ../test-optional.patch
# set jupyter path
  patch -p0 -i ../jupyter-path.patch
# fix timeit with Python 2.7.11
  patch -p0 -i ../python-2.7.11.patch
# search system paths for cython includes
  patch -p1 -i ../cython-sys-path.patch
# fix regressions with ECM 7
  patch -p1 -i ../ecm-7.patch
# increase numerical tolerance, needed by scipy 0.18
  patch -p1 -i ../increase-rtol.patch

# Upstream patches  
# fix build against libfes 0.2 http://trac.sagemath.org/ticket/15209
#  patch -p0 -i ../fes02.patch
# disable fes module, fails to compile
  patch -p0 -i ../disable-fes.patch
# replace is_package_installed usage http://trac.sagemath.org/ticket/20377
  patch -p1 -i ../is-package-installed.patch
# port to Singular 4 https://trac.sagemath.org/ticket/17254
  patch -p1 -i ../sagemath-singular4.patch

# use python2
  sed -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|' -e 's|exec python|exec python2|' -i src/bin/*
  sed -e 's|cython {OPT}|cython2 {OPT}|' -e 's|python setup.py|python2 setup.py|' -i src/sage/misc/cython.py
  sed -e 's|exec ipython|exec ipython2|' -e 's|cygdb|cygdb2|' -i src/bin/sage
  sed -e "s|'cython'|'cython2'|" -i src/bin/sage-cython
  sed -e 's|python -c|python2 -c|' -i src/Makefile

# copy required private PARI header
  mkdir -p src/pari
  cp "$srcdir"/anal.h src/pari/anal.h
}

build() {
  cd sage/src

  export SAGE_ROOT="$srcdir"/sage
  export SAGE_LOCAL="/usr"
  export SAGE_SRC="$PWD"
  export CC=gcc

  make sage/libs/pari/auto_gen.pxi
  make sage/ext/interpreters/__init__.py

  python2 setup.py build
}

package() {
  cd sage/src

  export SAGE_ROOT="/usr"
  export SAGE_LOCAL="$SAGE_ROOT"
  export SAGE_SRC="$PWD"
  export CC=gcc
  export JUPYTER_PATH="$pkgdir"/usr/share/jupyter

  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build

  mkdir -p "$pkgdir"/usr/bin
  cp bin/sage "$pkgdir"/usr/bin
  for _i in arch-env banner cachegrind callgrind cleaner coverage coverageall cython env eval grep grepdoc inline-fortran ipython \
    massif maxima.lisp native-execute notebook num-threads.py omega open preparse python rst2sws rst2txt run run-cython runtests startuptime.py \
    sws2rst valgrind version.sh
  do
    cp bin/sage-$_i "$pkgdir"/usr/bin
  done
  cp bin/math-readline "$pkgdir"/usr/bin
  
  mkdir -p "$pkgdir"/usr/share/sage
  cp -r ext "$pkgdir"/usr/share/sage
  
# Create SAGE_SRC, needed for the notebook
  mkdir "$pkgdir"/usr/share/sage/source

# Remove sage_setup
  rm -r "$pkgdir"/usr/lib/python2.7/site-packages/sage_setup
}
