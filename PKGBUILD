# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: Michael Jakl <jakl.michael@gmail.com>
# With contributions from many kind people at https://aur.archlinux.org/packages/julia-git/

_pkgbase=julia
pkgbase=${_pkgbase}-git
pkgname=('julia-git' 'julia-git-docs')
pkgver=0.4.0.dev.4256.g6c2f580
pkgrel=1
pkgdesc='High-level, high-performance, dynamic programming language'
arch=('i686' 'x86_64')
url="http://julialang.org"
license=('GPL')
makedepends=('gcc-fortran' 'arpack' 'fftw' 'git' 'gmp' 'libgit2' 'libunwind' 'llvm' 'mpfr' 'pcre' 'suitesparse' 'patchelf')
# Needed if building the documentation
#makedepends+=('python2-sphinx' 'python2-sphinx_rtd_theme' 'python-pip' 'texlive-langcjk' 'texlive-latexextra')
options=('!emptydirs')
source=('git://github.com/JuliaLang/julia.git')
md5sums=('SKIP')


pkgver() {
  cd $_pkgbase

  # use the version from VERSION file
  ver=`git show master:VERSION | sed 's/-/./g'`
  # strip the last tag name from the HEAD description
  rev=`git describe --tags | sed 's/^.\+-\([0-9]\+-g[0-9a-f]\+\)$/\1/;s/-/./g'`
  echo $ver.$rev
}

prepare() {
  cd $_pkgbase
  git submodule init
  git submodule update

  cd doc
  # They use the Python2 version for sphinx which has on Arch a different name
  #sed s/sphinx-build/sphinx-build2/g -i Makefile
}

build() {
  make -C $_pkgbase prefix=/usr sysconfdir=/etc \
    USE_SYSTEM_LLVM=1 \
    USE_SYSTEM_LIBUNWIND=1 \
    USE_SYSTEM_PCRE=1 \
    USE_SYSTEM_LIBM=1 \
    USE_SYSTEM_OPENLIBM=0 \
    USE_SYSTEM_OPENSPECFUN=0 \
    USE_SYSTEM_DSFMT=0 \
    USE_SYSTEM_BLAS=1 \
    USE_SYSTEM_LAPACK=1 \
    USE_SYSTEM_FFTW=1 \
    USE_SYSTEM_GMP=1 \
    USE_SYSTEM_MPFR=1 \
    USE_SYSTEM_ARPACK=1 \
    USE_SYSTEM_SUITESPARSE=1 \
    USE_SYSTEM_RMATH=0 \
    USE_SYSTEM_LIBUV=0 \
    USE_SYSTEM_UTF8PROC=0 \
    USE_SYSTEM_LIBGIT2=1 \
    USE_SYSTEM_PATCHELF=1 \
    USE_INTEL_MKL=0 \
    USE_BLAS64=0 \
    USE_LLVM_SHLIB=0

  # Building doc
  cd $_pkgbase/doc
  echo "Doc build disabled"
  #make man
  #make latexpdf
  #make info
}

package_julia-git() {
  depends=('arpack' 'fftw' 'gmp' 'libgit2' 'libunwind' 'llvm' 'mpfr' 'pcre' 'suitesparse' 'patchelf' 'hicolor-icon-theme' 'xdg-utils') # 'utf8proc' (AUR) 'intel-mkl' (AUR)
  optdepends=('gnuplot: If using the Gaston Package from julia')
  install=julia.install
  provides=('julia')
  conflicts=('julia')
  backup=('etc/julia/juliarc.jl')

  make -C $_pkgbase DESTDIR=$pkgdir prefix=/usr sysconfdir=/etc \
    USE_SYSTEM_LLVM=1 \
    USE_SYSTEM_LIBUNWIND=1 \
    USE_SYSTEM_PCRE=1 \
    USE_SYSTEM_LIBM=1 \
    USE_SYSTEM_OPENLIBM=0 \
    USE_SYSTEM_OPENSPECFUN=0 \
    USE_SYSTEM_DSFMT=0 \
    USE_SYSTEM_BLAS=1 \
    USE_SYSTEM_LAPACK=1 \
    USE_SYSTEM_FFTW=1 \
    USE_SYSTEM_GMP=1 \
    USE_SYSTEM_MPFR=1 \
    USE_SYSTEM_ARPACK=1 \
    USE_SYSTEM_SUITESPARSE=1 \
    USE_SYSTEM_RMATH=0 \
    USE_SYSTEM_LIBUV=0 \
    USE_SYSTEM_UTF8PROC=0 \
    USE_SYSTEM_LIBGIT2=1 \
    USE_SYSTEM_PATCHELF=1 \
    USE_INTEL_MKL=0 \
    USE_BLAS64=0 \
    USE_LLVM_SHLIB=0 \
    install

  # Remove doc files
  rm -r $pkgdir/usr/share/doc/julia
}

package_julia-git-docs() {
  arch=('any')
  pkgdesc+=" (Documentation and examples)"
  provides=('julia-docs')
  conflicts=('julia-docs' 'julia-git-doc')

  echo "Doc building disabled, just the source files and examples"
  install -d "$pkgdir/usr/share/doc"
  cp -rv "$srcdir/$_pkgbase/doc" "$pkgdir/usr/share/doc/$_pkgbase"
  cp -rv "$srcdir/$_pkgbase/examples" "$pkgdir/usr/share/doc/$_pkgbase/examples"

  #cd $_pkgbase/doc/_build
  #install -D -m644 man/julialanguage.1 $pkgdir/usr/share/man/man1/julialanguage.1
  #install -D -m644 texinfo/JuliaLanguage.info $pkgdir/usr/share/info/julialanguage.info
  #install -D -m644 latex/JuliaLanguage.pdf $pkgdir/usr/share/julia/doc/julialanguage.pdf
  #cp -dpr --no-preserve=ownership html $pkgdir/usr/share/julia/doc/
}

# vim:set ts=2 sw=2 et:
