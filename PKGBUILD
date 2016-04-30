# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: Michael Jakl <jakl.michael@gmail.com>
# With contributions from many kind people at https://aur.archlinux.org/packages/julia-git/

_pkgbase=julia
pkgbase=${_pkgbase}-git
pkgname=('julia-git' 'julia-git-docs')
pkgver=0.5.0.dev.r30802.g7315f52
pkgrel=1
pkgdesc='High-level, high-performance, dynamic programming language'
arch=('i686' 'x86_64')
url="http://julialang.org"
license=('MIT')
makedepends=('gcc-fortran' 'arpack' 'fftw' 'git' 'gmp' 'libgit2' 'libunwind' 'llvm' 'mpfr' 'openlibm' 'openspecfun' 'pcre2' 'suitesparse' 'patchelf')
# Needed if building the documentation
#makedepends+=('juliadoc-git' 'texlive-langcjk' 'texlive-latexextra')
options=('!emptydirs')
source=(git://github.com/JuliaLang/julia.git#branch=master
        Make.user)
md5sums=('SKIP'
         'e6ed32e3fa745f640489e6f19ab5c7e8')


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

  # For /etc/ld.so.conf.d/
  echo '/usr/lib/julia' > julia.conf

  # Move the Make.user in place
  cp -v $srcdir/Make.user .
}

build() {
  # SSE2 is a requirement for Julia on 32-bit x86
  CFLAGS=${CFLAGS//-march=i686/-march=pentium4}
  CXXFLAGS=${CXXFLAGS//-march=i686/-march=pentium4}

  make -C $_pkgbase prefix=/usr sysconfdir=/etc

  # Building doc
  cd $_pkgbase/doc
  #make man
  #make latexpdf
  #make info
}

package_julia-git() {
  backup=('etc/ld.so.conf.d/julia.conf' 'etc/julia/juliarc.jl')
  depends=('arpack' 'fftw' 'gmp' 'libgit2' 'libunwind' 'llvm' 'mpfr' 'openlibm' 'openspecfun' 'pcre2' 'suitesparse' 'patchelf' 'hicolor-icon-theme' 'xdg-utils' 'desktop-file-utils' 'gtk-update-icon-cache') # 'utf8proc' (AUR) 'intel-mkl' (AUR)
  optdepends=('gnuplot: If using the Gaston Package from julia')
  provides=('julia')
  conflicts=('julia')
  backup=('etc/julia/juliarc.jl')

  CFLAGS=${CFLAGS//-march=i686/-march=pentium4}
  CXXFLAGS=${CXXFLAGS//-march=i686/-march=pentium4}

  cd $_pkgbase
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

package_julia-git-docs() {
  arch=('any')
  pkgdesc+=" (Documentation and examples)"
  provides=('julia-docs')
  conflicts=('julia-docs' 'julia-git-doc')

  # Source files and examples"
  install -d "$pkgdir/usr/share/doc"

  cd "$srcdir/$_pkgbase"
  cp -rv "doc" "$pkgdir/usr/share/doc/$_pkgbase"
  cp -rv "examples" "$pkgdir/usr/share/doc/$_pkgbase/examples"
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
