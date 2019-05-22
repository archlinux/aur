# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: Michael Jakl <jakl.michael@gmail.com>
# With contributions from many kind people at https://aur.archlinux.org/packages/julia-git/

_pkgbase=julia
pkgbase=${_pkgbase}-git
pkgname=('julia-git' 'julia-git-docs')
pkgver=1.3.0.DEV.r44719.gefd794e199
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
            '21f97b3441097e71db59e2205f644466d829bbd0b73a34bc8b857b4390cf8ffc'
            '030b37d711a08567e7f9c5f0626dec7aed02c83373b5ec666d519897b50218ea'
            '5eb9280c6b91c9be15a52de7dc5f05e69a5edbfe1c5d1f62497470a1aa0d1fa8')


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

  msg2 'Configuring the build...'
  cp -v $srcdir/Make.user .

  msg2 'Patching make install...'
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
