# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: Michael Jakl <jakl.michael@gmail.com>
# With contributions from many kind people at https://aur.archlinux.org/packages/julia-git/

_pkgbase=julia
pkgbase=${_pkgbase}-git
pkgname=('julia-git' 'julia-git-docs')
pkgver=1.1.0.DEV.r43604.g36d0116774
pkgrel=1
pkgdesc='High-level, high-performance, dynamic programming language'
arch=('x86_64')
url="https://julialang.org"
license=('MIT')
makedepends=('cmake' 'gcc-fortran' 'gmp' 'python2' 'git')
makedepends+=('cblas' 'hicolor-icon-theme' 'libgit2' 'libunwind' 'libutf8proc'
              'mbedtls' 'mpfr' 'openblas' 'openlibm' 'pcre2' 'suitesparse'
              'xdg-utils' 'desktop-file-utils' 'gtk-update-icon-cache') # 'llvm' 'patchelf' 'intel-mkl'
# Needed if building the documentation
#makedepends+=('juliadoc-git' 'texlive-langcjk' 'texlive-latexextra')
source=(git://github.com/JuliaLang/julia.git#branch=master
        Make.user
        julia-makefile.patch
        cblas.patch)
sha256sums=('SKIP'
            '89c7b3234cf87d132345b6c0194dae756836059d3793cc8a97cc6366203a6ae7'
            '29b68ecdaf91770585609f54e5559e571d6b57a6312a3e8335caa7d647a2d2ca'
            '5c346bf8ed9a5763cf3bf6478158297107f16bbc07052b43920f778f0018b77a')


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

  # Move the Make.user in place
  cp -v $srcdir/Make.user .

  # make 'make install' really just install
  patch -p0 -i ../julia-makefile.patch

  # add and use option to build with system cblas
  # https://github.com/JuliaLang/julia/pull/29540
  patch -p1 --no-backup-if-mismatch -i ../cblas.patch
}

build() {
  # See FS#57387 for why USE_SYSTEM_LLVM=0 is used, for now
  # See FS#58221 for why USE_SYSTEM_ARPACK=0 is used, for now
  env CFLAGS="$CFLAGS -w" CXXFLAGS="$CXXFLAGS -w" make -C "$_pkgbase"

  # Building doc
  cd $_pkgbase/doc
  #make man
  #make latexpdf
  #make info
}

check() {
  cd "$_pkgbase/test"

  # this is the make testall target, plus the --skip option from
  # travis/appveyor/circleci (one test fails with DNS resolution errors)
  ../julia --check-bounds=yes --startup-file=no ./runtests.jl all --skip Sockets
  find ../stdlib \( -name \*.cov -o -name \*.mem \) -delete
  rm -r depot/compiled
}

package_julia-git() {
  depends=('cblas' 'hicolor-icon-theme' 'libgit2' 'libunwind' 'libutf8proc'
           'mbedtls' 'mpfr' 'openblas' 'openlibm' 'pcre2' 'suitesparse'
           'xdg-utils' 'desktop-file-utils' 'gtk-update-icon-cache') # 'llvm' 'patchelf' 'intel-mkl'
  optdepends=('openblas-lapack: multithreaded replacement for lapack'
              'fftw: If using the FFTW package from julia'
              'gnuplot: If using the Gaston Package from julia')
  provides=('julia')
  conflicts=('julia')
  backup=('etc/julia/juliarc.jl')

  CFLAGS=${CFLAGS//-march=i686/-march=pentium4}
  CXXFLAGS=${CXXFLAGS//-march=i686/-march=pentium4}

  make -C "$_pkgbase" DESTDIR="$pkgdir" install

  # Documentation and examples are in the julia-docs package
  rm -rf "$pkgdir/usr/share/"{doc,julia/doc,julia/examples}

  install -Dm644 "$_pkgbase/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgbase/LICENSE.md"

  # Remove files that don't belong into the package
  find ${pkgdir} -name ".gitignore" -delete
}

package_julia-git-docs() {
  arch=('any')
  pkgdesc='Documentation and examples for Julia'
  depends=('julia')
  provides=('julia-docs')
  conflicts=('julia-docs' 'julia-git-doc')

  install -d "$pkgdir/usr/share/doc"
  cp -r "$_pkgbase/doc" "$pkgdir/usr/share/doc/$_pkgbase"
  cp -r "$_pkgbase/examples" "$pkgdir/usr/share/doc/$_pkgbase/examples"
  install -Dm644 "$_pkgbase/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgbase/LICENSE.md"

  # Remove double
  rm -rf "$pkgdir/usr/share/doc/julia/man/"

  # Installing built docs. Adjust it accordingly to your changes in build()
  cd "$_pkgbase/doc/_build"
  cp -dpr --no-preserve=ownership html $pkgdir/usr/share/doc/julia/
  #install -D -m644 man/julialanguage.1 $pkgdir/usr/share/man/man1/julialanguage.1
  #install -D -m644 texinfo/JuliaLanguage.info $pkgdir/usr/share/info/julialanguage.info
  #install -D -m644 latex/JuliaLanguage.pdf $pkgdir/usr/share/julia/doc/julialanguage.pdf

  # Remove files that don't belong into the package
  find ${pkgdir} -name ".gitignore" -delete
}

# vim:set ts=2 sw=2 et:
