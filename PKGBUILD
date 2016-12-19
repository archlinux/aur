# Maintainer: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas Dziedzic <gostrc at gmail dot com>
# Contributor: Osman Ugus <ugus11 at yahoo dot com>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>
# Special thanks to Nareto for moving the compile from the .install to the PKGBUILD

pkgbase=sagemath-git
pkgname=(sagemath-git sagemath-jupyter-git)
pkgver=7.5.rc0.r0.ga4df481584
pkgrel=1
pkgdesc="Open Source Mathematics Software, free alternative to Magma, Maple, Mathematica, and Matlab"
arch=(i686 x86_64)
url="http://www.sagemath.org"
license=(GPL)
depends=(ipython2 ppl palp brial cliquer maxima-ecl gfan sympow tachyon nauty python2-rpy2 python2-fpylll
  python2-matplotlib python2-scipy python2-sympy python2-networkx python2-pillow python2-future libgap flintqs lcalc lrcalc arb
  eclib gmp-ecm zn_poly gd python2-cvxopt pynac linbox rubiks pari-galdata pari-seadata-small planarity rankwidth
  sage-data-combinatorial_designs sage-data-elliptic_curves sage-data-graphs sage-data-polytopes_db sage-data-conway_polynomials)
optdepends=('cython2: to compile cython code' 'python2-pkgconfig: to compile cython code'
  'jmol: 3D plots' 'sage-notebook: Browser-based (flask) notebook interface'
  'sagemath-doc: Documentation and inline help' 'python2-igraph: igraph backend for graph theory'
  'coin-or-cbc: COIN backend for numerical computations' 'coin-or-csdp: for computing Lovász theta-function of graphs'
  'buckygen: for generating fullerene graphs' 'plantri: for generating some classes of graphs' 'benzene: for generating fusenes and benzenoids'
  'modular_decomposition: modular decomposition of graphs' 'ffmpeg: to export animations to video' 'imagemagick: to show animations'
  'coxeter3: Coxeter groups implementation' 'cryptominisat2: SAT solver' 'gap-data: for computing Galois groups'
  'lrs: Algorithms for linear reverse search used in game theory and for computing volume of polytopes'
  'libhomfly: for computing the homfly polynomial of links' 'libbraiding: for computing in braid groups')
makedepends=(cython2 boost ratpoints symmetrica fflas-ffpack python2-jinja coin-or-cbc libhomfly libbraiding
  mcqd coxeter3 cryptominisat2 modular_decomposition bliss-graphs tdlib python2-pkgconfig meataxe git) # libfes
source=("git://git.sagemath.org/sage.git#branch=develop" 
        env.patch skip-check.patch cython-sys-path.patch is-package-installed.patch package.patch disable-fes.patch
        jupyter-path.patch test-optional.patch ecm-7.patch increase-rtol.patch)
md5sums=('SKIP'
         '70b7c1c5da6400e1ae48cf1e5a2d2879'
         '17771a1e59e14535cc837a189d3cb8a7'
         '0de8f29a99a48e2ca2a13045f122c386'
         '409b0a2c520eb33281b5f262afcb6c76'
         'ccfd5b1bc4796f414f1531be52504dd7'
         'a40b32a7b5d83379745b538be85064c8'
         'e618d534f42428e298e12b1aa94c1a31'
         '921017fd2d9dadbb6b602ac0476bfd58'
         'e4a91dcedbc5e617919e5a9bf1310f24'
         '1db8db7bfed5f991d55ae11d810ff5cb')

pkgver() {
  cd sage
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare(){
  cd sage

# Arch-specific patches
# assume all optional packages are installed
  patch -p0 -i ../package.patch
# don't try to link against libpng 1.2
  sed -e 's|png12|png|' -i src/module_list.py
# set env variables
  patch -p0 -i ../env.patch
# skip checking build status
  patch -p0 -i ../skip-check.patch
# don't list optional packages when running tests
  patch -p0 -i ../test-optional.patch
# set jupyter path
  patch -p0 -i ../jupyter-path.patch
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

# use python2
  sed -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|' -e 's|exec python|exec python2|' -i src/bin/*
  sed -e 's|cython {OPT}|cython2 {OPT}|' -e 's|python setup.py|python2 setup.py|' -i src/sage/misc/cython.py
  sed -e 's|exec ipython|exec ipython2|' -e 's|cygdb|cygdb2|g' -i src/bin/sage
  sed -e "s|'cython'|'cython2'|" -i src/bin/sage-cython
}

build() {
  cd sage/src

  export SAGE_LOCAL="/usr"
  export SAGE_ROOT="$PWD"
  export SAGE_SRC="$PWD"
  export CC=gcc

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
  depends=(sagemath python2-jupyter_client python2-ipywidgets jupyter-notebook mathjax)
  optdepends=('sage-notebook-exporter: convert flask notebooks to Jupyter')

  cd sage/src

  export SAGE_ROOT="$PWD"
  export SAGE_LOCAL="/usr"
  export JUPYTER_PATH="$pkgdir"/usr/share/jupyter

  python2 -c "from sage.repl.ipython_kernel.install import SageKernelSpec; SageKernelSpec.update()"
}
