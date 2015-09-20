# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: Michael Jakl <jakl.michael@gmail.com>
# With contributions from many kind people at https://aur.archlinux.org/packages/julia-git/

_pkgbase=julia
pkgbase=${_pkgbase}-git
pkgname=('julia-git' 'julia-git-docs')
pkgver=0.5.0.dev.r27289.g8681313
pkgrel=2
pkgdesc='High-level, high-performance, dynamic programming language'
arch=('i686' 'x86_64')
url="http://julialang.org"
license=('MIT')
makedepends=('gcc-fortran' 'arpack' 'fftw' 'git' 'gmp' 'libgit2' 'libunwind' 'llvm' 'mpfr' 'openlibm' 'openspecfun' 'pcre2' 'suitesparse' 'patchelf')
# Needed if building the documentation
#makedepends+=('juliadoc-git' 'texlive-langcjk' 'texlive-latexextra')
options=('!emptydirs')
source=(git://github.com/JuliaLang/julia.git#branch=master)
md5sums=('SKIP')


pkgver() {
  cd $_pkgbase

  # use the version from VERSION file
  ver=`git show makepkg:VERSION | sed 's/-/./g'`
  # Combine ver with rev-count and latest commit
  printf "%s.r%s.g%s" $(echo $ver) "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgbase
  git submodule init
  git submodule update
}

build() {
  make -C $_pkgbase prefix=/usr sysconfdir=/etc \
    USE_SYSTEM_LLVM=1 \
    USE_SYSTEM_LIBUNWIND=1 \
    USE_SYSTEM_PCRE=1 \
    USE_SYSTEM_LIBM=1 \
    USE_SYSTEM_OPENLIBM=1 \
    USE_SYSTEM_OPENSPECFUN=1 \
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
  #make man
  #make latexpdf
  #make info
}

package_julia-git() {
  depends=('arpack' 'fftw' 'gmp' 'libgit2' 'libunwind' 'llvm' 'mpfr' 'openlibm' 'openspecfun' 'pcre2' 'suitesparse' 'patchelf' 'hicolor-icon-theme' 'xdg-utils') # 'utf8proc' (AUR) 'intel-mkl' (AUR)
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
    USE_SYSTEM_OPENLIBM=1 \
    USE_SYSTEM_OPENSPECFUN=1 \
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

  # Install license
  install -Dm644 "$_pkgbase"/LICENSE.md "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE.md"
}

package_julia-git-docs() {
  arch=('any')
  pkgdesc+=" (Documentation and examples)"
  provides=('julia-docs')
  conflicts=('julia-docs' 'julia-git-doc')

  # Source files and examples"
  install -d "$pkgdir/usr/share/doc"
  cp -rv "$srcdir/$_pkgbase/doc" "$pkgdir/usr/share/doc/$_pkgbase"
  cp -rv "$srcdir/$_pkgbase/examples" "$pkgdir/usr/share/doc/$_pkgbase/examples"

  # Remove double
  rm -rv "$pkgdir/usr/share/doc/julia/man/"

  # Installing built docs. Adjust it accordingly to your changes in build()
  cd $_pkgbase/doc/_build
  cp -dpr --no-preserve=ownership html $pkgdir/usr/share/doc/julia/
  #install -D -m644 man/julialanguage.1 $pkgdir/usr/share/man/man1/julialanguage.1
  #install -D -m644 texinfo/JuliaLanguage.info $pkgdir/usr/share/info/julialanguage.info
  #install -D -m644 latex/JuliaLanguage.pdf $pkgdir/usr/share/julia/doc/julialanguage.pdf
}

# vim:set ts=2 sw=2 et:
