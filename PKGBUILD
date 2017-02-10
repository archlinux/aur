# Maintainer: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas Dziedzic <gostrc at gmail dot com>
# Contributor: Osman Ugus <ugus11 at yahoo dot com>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>
# Special thanks to Nareto for moving the compile from the .install to the PKGBUILD

pkgbase=sagemath-git
pkgname=(sagemath-git sagemath-jupyter-git)
pkgver=7.6.beta3.r0.gbf876cbd5a
pkgrel=1
pkgdesc="Open Source Mathematics Software, free alternative to Magma, Maple, Mathematica, and Matlab"
arch=(i686 x86_64)
url="http://www.sagemath.org"
license=(GPL)
depends=(ipython2 ppl palp brial cliquer maxima-ecl gfan sympow nauty python2-rpy2 python2-fpylll python2-psutil
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
  'libhomfly: for computing the homfly polynomial of links' 'libbraiding: for computing in braid groups'
  'libfes: exhaustive search of solutions for boolean equations' 'python2-pynormaliz: Normaliz backend for polyhedral computations'
  'three.js: alternative 3D plots engine' 'tachyon: alternative 3D plots engine')
makedepends=(cython2 boost ratpoints symmetrica python2-jinja coin-or-cbc libhomfly libbraiding
  mcqd coxeter3 cryptominisat2 modular_decomposition bliss-graphs tdlib python2-pkgconfig meataxe libfes git)
source=("git://git.sagemath.org/sage.git#branch=develop" 
        env.patch skip-check.patch cython-sys-path.patch is-package-installed.patch package.patch
        jupyter-path.patch test-optional.patch ecm-7.patch increase-rtol.patch r-no-readline.patch
        sagemath-planarity3.patch fes02.patch)
sha256sums=('SKIP'
            '9dba04ff13626a7b6c338a8b18a6c27d343f68a547a218533cf773af3dae6635'
            '178074c0a22da4a8129ec299a6845aaae8cf3ef1da6f62b34f2ec0ed50c1e6a2'
            'ff7e034d08ab084fdb193484f7fe3a659ebcd8ab33a2b7177237d65b26de7872'
            'd60fb0fbd27991ce9496ca035a54b03334b5b53f244227a8d6e13f3327ce75d2'
            '4a2297e4d9d28f0b3a1f58e1b463e332affcb109eafde44837b1657e309c8212'
            '889b65598d2a15e73eb482f543ec9b28d8992eeb57b07883c2e9627dfee15a9b'
            '81d08c6a760f171f3381455b66a6c84789c9f0eefddbe6ca5794075514ad8c3a'
            '06bc1e5b409e21d49fc71ef03e96ec35b7a9b524bfd1f81a2dbf5c64a55e5acf'
            '1c068c524a2926ba222b36b0f4229a45c6f00c2225ffde0b0555e4e9659342d5'
            'ef9f401fa84fe1772af9efee6816643534f2896da4c23b809937b19771bdfbbf'
            'a1c562ebe4538d672404ca3ac2e954a3c955afeb7463f7b4fe6eaa6fa74fe5c7'
            'a39da083c038ada797ffc5bedc9ba47455a3f77057d42f86484ae877ef9172ea')

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
# fix freezes in R interface with readline 7 (Debian)
  patch -p1 -i ../r-no-readline.patch
# fix build with planarity 3 (Debian)
  patch -p2 -i ../sagemath-planarity3.patch

# Upstream patches  
# fix build against libfes 0.2 http://trac.sagemath.org/ticket/15209
  patch -p1 -i ../fes02.patch
# replace is_package_installed usage http://trac.sagemath.org/ticket/20377
  patch -p1 -i ../is-package-installed.patch

# use python2
  sed -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|' -e 's|exec python|exec python2|' -i src/bin/*
  sed -e 's|cython {OPT}|cython2 {OPT}|' -e 's|python setup.py|python2 setup.py|' -i src/sage/misc/cython.py
  sed -e 's|exec ipython|exec ipython2|' -e 's|cygdb|cygdb2|g' -i src/bin/sage
  sed -e "s|'cython'|'cython2'|" -i src/bin/sage-cython
  sed -e 's|bin/python|bin/python2|g' -i src/bin/sage-env
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
