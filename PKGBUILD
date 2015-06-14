# $Id: PKGBUILD 118896 2014-09-13 07:12:02Z arcanis $
# Maintainer: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas Dziedzic <gostrc at gmail dot com>
# Contributor: Osman Ugus <ugus11 at yahoo dot com>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>
# Special thanks to Nareto for moving the compile from the .install to the PKGBUILD

pkgname=sagemath-git
pkgver=6.8.beta4.r0.g06dbbff
pkgrel=1
pkgdesc="Open Source Mathematics Software, free alternative to Magma, Maple, Mathematica, and Matlab"
arch=('i686' 'x86_64')
url="http://www.sagemath.org"
license=('GPL')
depends=('ipython2' 'ppl' 'glpk' 'mpfi' 'palp' 'polybori' 'singular' 'libcliquer' 'maxima-ecl' 'gfan' 'sympow' 'tachyon' 'python2-rpy2'
  'python2-matplotlib' 'python2-scipy' 'python2-sympy' 'python2-networkx' 'libgap' 'gap' 'flintqs' 'lcalc' 'lrcalc'
  'eclib' 'gmp-ecm' 'zn_poly' 'gd' 'python2-cvxopt' 'pynac' 'linbox' 'gsl' 'rubiks' 'pari-galdata' 'pari-seadata-small' 'planarity'
  'sage-data-combinatorial_designs' 'sage-data-elliptic_curves' 'sage-data-graphs' 'sage-data-polytopes_db' 'sage-data-conway_polynomials')
optdepends=('cython2: to compile cython code'
	'jmol: 3D plots'
	'sage-notebook: Browser-based (flask) notebook interface'
	'sagemath-doc: Documentation and inline help'
	'sagemath-src: source files needed to build cython code'
	'ipython2-notebook: IPython notebook interface'
	'mathjax: IPython notebook interface'
	'coin-or-cbc: COIN backend for numerical computations'
	'nauty: for generating some classes of graphs'
	'buckygen: for generating fullerene graphs'
	'plantri: for generating some classes of graphs'
	'benzene: for generating fusenes and benzenoids'
	'modular_decomposition: modular decomposition of graphs'
	'lrs: Algorithms for linear reverse search used in game theory and for computing volume of polytopes' 
	'imagemagick: to show animations'
	'coxeter3: Coxeter groups implementation'
	'cryptominisat: SAT solver'
	'arb: floating-point ball arithmetic')
makedepends=('cython2-devel' 'boost' 'ratpoints' 'symmetrica' 'fflas-ffpack' 'python2-jinja' 'coin-or-cbc'
  'mcqd' 'coxeter3' 'cryptominisat' 'arb' 'modular_decomposition' 'bliss-graphs')
conflicts=('sagemath')
provides=('sagemath' 'sage-mathematics')
source=("git://git.sagemath.org/sage.git#branch=develop" 
"http://mirrors.mit.edu/sage/spkg/upstream/pexpect/pexpect-2.0.tar.bz2" 'anal.h'
'package.patch' 'env.patch' 'paths.patch' 'clean.patch' 'skip-check.patch' 
'pexpect-env.patch' 'pexpect-del.patch' 'ntl9.patch' 'disable-fes.patch')
md5sums=('SKIP'
         'd9a3e113ed147dcee8f89962a8dccd43'
         'a906a180d198186a39820b0a2f9a9c63'
         'f72e544032b1a3f952b7ddafc3a49d63'
         'a97ad60cca257b389f1e6e60eef2525f'
         'fd8e3e07f5b7318e6a7200a3c64f5bc2'
         'f713e659637aafc1dd39f8aef638d1b9'
         '5947a420a0b1483f0cbc74c76895789b'
         'a83a3b1bc7fcb7cbf752a83a8311fc42'
         'f333939ea6c41377b66407c81016cee4'
         '308abbb1a49db9b8f0e088aff69567ff'
         '4eb23a3c7363258bc9ba764d6e5512ba')

pkgver() {
  cd sage
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}


prepare(){
  cd sage

# Arch-specific patches
# assume all optional packages are installed
  patch -p0 -i "$srcdir"/package.patch
# find L.h header
  sed -e 's|libLfunction|Lfunction|' -i src/module_list.py
# don't try to link against libpng 1.2
  sed -e 's|png12|png|' -i src/module_list.py
# set env variables
  patch -p0 -i "$srcdir"/env.patch
# fix paths in python imports
  patch -p0 -i "$srcdir"/paths.patch
# fix cython linking
  sed -e "s| atlas(),||" -i src/sage/misc/cython.py
# don't try to remove installed files
  patch -p0 -i "$srcdir"/clean.patch
# skip checking build status
  patch -p0 -i "$srcdir"/skip-check.patch
# supress warning about GAP install dir
  sed -e "s|gapdir = os.path.join(SAGE_LOCAL, 'gap', 'latest')|gapdir = '/usr/lib/gap'|" -i src/sage/libs/gap/util.pyx 
# fix Cremona database detection
  sed -e "s|is_package_installed('database_cremona_ellcurve')|os.path.exists('/usr/share/sage/cremona/cremona.db')|" \
   -i src/sage/databases/cremona.py
# fix IPython kernel path
  sed -e "s|os.path.join(SAGE_ROOT, 'sage')|'/usr/bin/sage'|" -i src/sage/repl/ipython_kernel/install.py
# find bliss headers
  sed -e 's|graph.hh|bliss/graph.hh|' -i src/sage/graphs/bliss.pyx
# Rename class to fix conflicts with NTL
  sed -e 's|WrappedPtr|SageWrappedPtr|' -i src/sage/libs/polybori/decl.pxd -i src/sage/libs/polybori/pb_wrap.h  
# Disable fes module, broken upstream
  patch -p0 -i "$srcdir"/disable-fes.patch

# Upstream patches  
# fix build aginst NTL 9 (Fedora)
  patch -p0 -i "$srcdir"/ntl9.patch

# use python2
  sed -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|' -e 's|exec python|exec python2|' -i src/bin/*
  sed -e 's|cython %s %s|cython2 %s %s|' -e 's|python setup.py|python2 setup.py|' -i src/sage/misc/cython.py
  sed -e 's|exec ipython|exec ipython2|' -e 's|cygdb|cygdb2|' -i src/bin/sage
  sed -e "s|'cython'|'cython2'|" -i src/bin/sage-cython
  sed -e 's|python -c|python2 -c|' -i src/Makefile

# copy required private PARI header
  mkdir -p src/pari
  cp "$srcdir"/anal.h src/pari/anal.h

# remove developer interface
  rm -r src/sage/dev

  cd "$srcdir"/pexpect-2.0
# fix env in pexpect
  patch -p1 -i "$srcdir"/pexpect-env.patch
# hide exceptions in pexpect
  patch -p1 -i "$srcdir"/pexpect-del.patch
}


build() {
  cd sage/src

  export SAGE_LOCAL="/usr"
  export SAGE_SRC="$PWD"
  export CC=gcc
  
  make sage/libs/pari/auto_gen.pxi
  make sage/ext/interpreters/__init__.py

  python2 setup.py build

# build pexpect
  pushd "$srcdir"/pexpect-2.0
    python2 setup.py build
  popd
}


package() {
  cd sage/src

  export SAGE_ROOT="/usr"
  export SAGE_LOCAL="$SAGE_ROOT"
  export SAGE_SRC="$PWD"

  python2 setup.py install --root="$pkgdir" --optimize=1

  mkdir -p "$pkgdir"/usr/bin
  cp bin/sage "$pkgdir"/usr/bin
  for _i in arch-env banner cachegrind callgrind cleaner coverage coverageall CSI CSI-helper.py cython env eval grep grepdoc inline-fortran ipython \
    massif maxima.lisp native-execute notebook num-threads.py omega open preparse python rst2sws rst2txt run run-cython runtests startuptime.py \
    sws2rst valgrind version.sh
  do
    cp bin/sage-$_i "$pkgdir"/usr/bin
  done
  cp bin/math-readline "$pkgdir"/usr/bin
  
  mkdir -p "$pkgdir"/usr/share/sage
  cp -r ext "$pkgdir"/usr/share/sage
  
# Create SAGE_SRC, needed for the notebook
  mkdir "$pkgdir"/usr/share/sage/src

# Install Sage's own pexpect
  cd "$srcdir"/pexpect-2.0
  python2 setup.py install --root="$pkgdir" --optimize=1
  mkdir -p "$pkgdir"/usr/lib/sage/site-packages/
  mv "$pkgdir"/usr/lib/python2.7/site-packages/pexpect* "$pkgdir"/usr/lib/sage/site-packages/
}
