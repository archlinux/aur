# Maintainer: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas Dziedzic <gostrc at gmail dot com>
# Contributor: Osman Ugus <ugus11 at yahoo dot com>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>
# Special thanks to Nareto for moving the compile from the .install to the PKGBUILD

pkgname=sagemath-git
pkgver=7.2.beta4.r0.g0aec256
pkgrel=1
pkgdesc="Open Source Mathematics Software, free alternative to Magma, Maple, Mathematica, and Matlab"
arch=(i686 x86_64)
url="http://www.sagemath.org"
license=(GPL)
depends=(ipython2 cysignals ppl mpfi palp brial singular cliquer maxima-ecl gfan sympow tachyon python2-rpy2 nauty
  python2-matplotlib python2-scipy python2-sympy python2-networkx python2-igraph libgap flintqs lcalc lrcalc lrs arb
  eclib gmp-ecm zn_poly gd python2-cvxopt pynac linbox gsl rubiks pari-galdata pari-seadata-small planarity rankwidth
  sage-data-combinatorial_designs sage-data-elliptic_curves sage-data-graphs sage-data-polytopes_db sage-data-conway_polynomials)
optdepends=('cython2: to compile cython code' 'jmol: 3D plots' 'sage-notebook: Browser-based (flask) notebook interface'
  'sagemath-doc: Documentation and inline help' 'ipython2-notebook: Jupyter notebook interface' 'mathjax: Jupyter notebook interface'
  'coin-or-cbc: COIN backend for numerical computations' 'coin-or-csdp: for computing Lovász theta-function of graphs'
  'buckygen: for generating fullerene graphs' 'plantri: for generating some classes of graphs' 'benzene: for generating fusenes and benzenoids'
  'modular_decomposition: modular decomposition of graphs' 'ffmpeg: to export animations to video' 'imagemagick: to show animations'
  'coxeter3: Coxeter groups implementation' 'cryptominisat: SAT solver' 'gap-data: for computing Galois groups'
  'jupyter-notebook: Jupyter notebook interface' 'atlas-lapack: improved performance for some linear algebra operations')
makedepends=(cython2 boost ratpoints symmetrica fflas-ffpack python2-jinja coin-or-cbc
  mcqd coxeter3 cryptominisat modular_decomposition bliss-graphs tdlib python2-pkgconfig meataxe) # libfes
conflicts=(sagemath)
provides=(sagemath sage-mathematics)
source=("git://git.sagemath.org/sage.git#branch=develop" 
        pexpect.zip::"https://github.com/pexpect/pexpect/archive/524495960dd8898ddd30f7ba37298de51beee773.zip"
        anal.h package.patch env.patch paths.patch clean.patch skip-check.patch cython-sys-path.patch
        disable-fes.patch jupyter-path.patch test-optional.patch python-2.7.11.patch)
md5sums=('SKIP'
         'a346bb2c0350c1cb17d5325235c5e38a'
         'a906a180d198186a39820b0a2f9a9c63'
         '9ba81f717ffd4e20b8b2f2a318307488'
         'f6c62f0ccc168c5e6e3dd9d6f73f6389'
         '0f746ed394fd7eb7a6b3963014976098'
         '6d9ae0978ce6a05a0da2cafdfb178a09'
         '5947a420a0b1483f0cbc74c76895789b'
         'a1bcdd3fe620dbae60ed8b0e98b2ece7'
         '4eb23a3c7363258bc9ba764d6e5512ba'
         '16b529194c6105c3364127bd8f1efa83'
         'cdcabd475b80afe0534a5621e972736e'
         'ef927896f2071b442b1d07d7e69f5f3a')

pkgver() {
  cd sage
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}


prepare(){
  cd sage

# Arch-specific patches
# assume all optional packages are installed
  patch -p0 -i ../package.patch
# find L.h header
  sed -e 's|libLfunction|Lfunction|' -i src/sage/libs/lcalc/lcalc_sage.h
# don't try to link against libpng 1.2
  sed -e 's|png12|png|' -i src/module_list.py
# set env variables
  patch -p0 -i ../env.patch
# fix paths in python imports
  patch -p0 -i ../paths.patch
# don't try to remove installed files
  patch -p0 -i ../clean.patch
# skip checking build status
  patch -p0 -i ../skip-check.patch
# supress warning about GAP install dir
  sed -e "s|gapdir = os.path.join(SAGE_LOCAL, 'gap', 'latest')|gapdir = '/usr/lib/gap'|" -i src/sage/libs/gap/util.pyx 
# fix Cremona database detection
  sed -e "s|is_package_installed('database_cremona_ellcurve')|os.path.exists('/usr/share/sage/cremona/cremona.db')|" \
   -i src/sage/databases/cremona.py
# find bliss headers
  sed -e 's|graph.hh|bliss/graph.hh|' -i src/sage/graphs/bliss.pyx
# don't list optional packages when running tests
  patch -p0 -i ../test-optional.patch
# set jupyter path
  patch -p0 -i ../jupyter-path.patch
# fix timeit with Python 2.7.11
  patch -p0 -i ../python-2.7.11.patch
# search system paths for cython includes
  patch -p1 -i ../cython-sys-path.patch

# Upstream patches  
# fix build against libfes 0.2 http://trac.sagemath.org/ticket/15209
#  patch -p0 -i ../fes02.patch
# disable fes module, fails to compile
  patch -p0 -i ../disable-fes.patch 

# use python2
  sed -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|' -e 's|exec python|exec python2|' -i src/bin/*
  sed -e 's|cython {OPT}|cython2 {OPT}|' -e 's|python setup.py|python2 setup.py|' -i src/sage/misc/cython.py
  sed -e 's|exec ipython|exec ipython2|' -e 's|cygdb|cygdb2|' -i src/bin/sage
  sed -e "s|'cython'|'cython2'|" -i src/bin/sage-cython
  sed -e 's|python -c|python2 -c|' -i src/Makefile

# copy required private PARI header
  mkdir -p src/pari
  cp "$srcdir"/anal.h src/pari/anal.h

# remove developer interface
  rm -r src/sage/dev
}

build() {
  cd sage/src

  export SAGE_LOCAL="/usr"
  export SAGE_SRC="$PWD"
  export CC=gcc

  make sage/libs/pari/auto_gen.pxi
  make sage/ext/interpreters/__init__.py

  python2 setup.py build

  cd "$srcdir"/pexpect-*
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

# install pexpect
  cd "$srcdir"/pexpect-*
  python2 setup.py install --root="$pkgdir" --optimize=1
  mkdir -p "$pkgdir"/usr/lib/sage/site-packages/
  mv "$pkgdir"/usr/lib/python2.7/site-packages/pexpect "$pkgdir"/usr/lib/sage/site-packages/
}
