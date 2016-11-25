# Maintainer: Israel Herraiz <isra@herraiz.org>

_pkgbase=julia-mkl
pkgbase=${_pkgbase}-git
pkgname=('julia-mkl-git' 'julia-mkl-git-docs')
pkgver=0.6.0.dev.r34222.g03c2464
pkgrel=1
pkgdesc='High-level, high-performance, dynamic programming language (compiled with the Intel MKL library)'
arch=('x86_64')
url="http://julialang.org"
license=('MIT')
makedepends=('intel-mkl' 'intel-compiler-base' 'intel-fortran-compiler' 'git')
makedepends+=('libgit2' 'libunwind' 'llvm' 'mbedtls' 'mpfr' 'pcre2' 'suitesparse-mkl' 'patchelf' 'hicolor-icon-theme' 'xdg-utils' 'desktop-file-utils' 'gtk-update-icon-cache')
# Needed if building the documentation
#makedepends+=('juliadoc-git' 'texlive-langcjk' 'texlive-latexextra')
options=('!emptydirs')
source=(git://github.com/JuliaLang/julia.git#branch=master
        Make.user)
md5sums=('SKIP'
         'ac0478ae196443de8d9fea6941b63797')


pkgver() {
  cd julia

  # use the version from VERSION file
  ver=`git show makepkg:VERSION | sed 's/-/./g'`
  # Combine ver with rev-count and latest commit
  printf "%s.r%s.g%s" $(echo $ver) "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd julia
  git submodule init
  git submodule update

  # For /etc/ld.so.conf.d/
  echo '/usr/lib/julia' > julia.conf

  # Move the Make.user in place
  cp -v $srcdir/Make.user .
}

build() {
  
  source /opt/intel/mkl/bin/mklvars.sh intel64
  source /opt/intel/composerxe/linux/bin/compilervars.sh intel64

  make -C julia prefix=/usr sysconfdir=/etc

  # Building doc
  cd julia/doc
  #make man
  #make latexpdf
  #make info
}

package_julia-mkl-git() {
  backup=('etc/ld.so.conf.d/julia.conf' 'etc/julia/juliarc.jl')
  depends=('gmp' 'libgit2' 'libunwind' 'llvm' 'mbedtls' 'mpfr' 'pcre2' 'suitesparse-mkl' 'patchelf' 'hicolor-icon-theme' 'xdg-utils' 'desktop-file-utils' 'gtk-update-icon-cache' 'intel-mkl')
  optdepends=('gnuplot: If using the Gaston Package from julia')
  provides=('julia')
  conflicts=('julia' 'julia-git')
  backup=('etc/julia/juliarc.jl')

  source /opt/intel/mkl/bin/mklvars.sh intel64
  source /opt/intel/composerxe/linux/bin/compilervars.sh intel64

  cd julia
  make DESTDIR=$pkgdir prefix=/usr sysconfdir=/etc install

  # For /etc/ld.so.conf.d, FS#41731
  install -Dm644 julia.conf "$pkgdir/etc/ld.so.conf.d/julia.conf"

  # Remove doc files
  rm -r $pkgdir/usr/share/doc/julia

  # Install license
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgbase/LICENSE.md"

  # Remove files that don't belong into the package
  find ${pkgdir} -name ".gitignore" -delete
}

package_julia-mkl-git-docs() {
  arch=('any')
  pkgdesc+=" -- Documentation and examples"
  provides=('julia-docs')
  conflicts=('julia-docs' 'julia-git-doc' 'julia-git-docs')

  # Source files and examples"
  install -d "$pkgdir/usr/share/doc"

  cd "$srcdir/julia"
  cp -rv "doc" "$pkgdir/usr/share/doc/julia"
  cp -rv "examples" "$pkgdir/usr/share/doc/julia/examples"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

  # Remove double
  rm -rv "$pkgdir/usr/share/doc/julia/man/"

  # Installing built docs. Adjust it accordingly to your changes in build()
  cd doc/_build
  cp -dpr --no-preserve=ownership html $pkgdir/usr/share/doc/julia/
  #install -D -m644 man/julialanguage.1 $pkgdir/usr/share/man/man1/julialanguage.1
  #install -D -m644 texinfo/JuliaLanguage.info $pkgdir/usr/share/info/julialanguage.info
  #install -D -m644 latex/JuliaLanguage.pdf $pkgdir/usr/share/julia/doc/julialanguage.pdf

  # Remove files that don't belong into the package
  find ${pkgdir} -name ".gitignore" -delete
}

# vim:set ts=2 sw=2 et:
