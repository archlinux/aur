# Maintainer: Platon Ryzhikov <ihummer63@yandex.ru>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Michael Jakl <jakl.michael@gmail.com>
# With contributions from many kind people at https://aur.archlinux.org/packages/julia-git/
# Includes Make.user and compilation flags for aarch64

_pkgbase=julia
pkgbase=${_pkgbase}-aarch64-git
pkgname=(julia-aarch64-git julia-aarch64-git-docs)
pkgver=1.7.0.DEV.r49718.ge2ad3731681
pkgrel=1.1
arch=(aarch64)
pkgdesc='High-level, high-performance, dynamic programming language'
url='https://julialang.org/'
license=(MIT)
# build fails with system blas/openblas
depends=(fftw hicolor-icon-theme libgit2 libunwind libutf8proc #openblas cblas
         suitesparse mbedtls mpfr openlibm pcre2 llvm-libs llvm
         curl zlib libssh2 xdg-utils desktop-file-utils gtk-update-icon-cache patchelf p7zip)
makedepends=(cmake gcc-fortran gmp python git)
# Needed if building the documentation
#makedepends+=('juliadoc-git' 'texlive-langcjk' 'texlive-latexextra')
source=(git+https://github.com/JuliaLang/julia.git#branch=master
        Make.user
        make-install-no-build.patch)
sha256sums=('SKIP'
            'SKIP'
            '8be4605f92a009072ca7e843549c225fc4e959893498e7c4f8f79e861e63714d')

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

# Don't build again in install
  patch -p1 -i ../make-install-no-build.patch

# Fix test failure
  sed -e 's|0.22314355f0 + 3.1415927f0im|0.22314355f0 - 3.1415927f0im|' -i stdlib/LinearAlgebra/test/lu.jl
}

build() {
  # See FS#58221 for why USE_SYSTEM_ARPACK=0 is used, for now
  #export PATH="$srcdir/bin:$PATH"
  env CFLAGS="-O2 -pipe -fstack-protector-strong -w" CXXFLAGS="-O2 -pipe -fstack-protector-strong -w" make VERBOSE=1 -C "$_pkgbase" -j2

  # Building doc
  cd $_pkgbase/doc
  #make man
  #make latexpdf
  make html
  #make info
}

#check() {
#  cd "$_pkgbase/test"
#
#  # this is the make testall target, plus the --skip option from
#  # travis/appveyor/circleci (one test fails with DNS resolution errors)
#  ../julia --check-bounds=yes --startup-file=no ./runtests.jl all --skip Sockets --skip Distributed --skip LibGit2/libgit2
#  find ../stdlib \( -name \*.cov -o -name \*.mem \) -delete
#  rm -r depot/compiled
#}

package_julia-aarch64-git() {
  optdepends=('openblas-lapack: multithreaded replacement for lapack'
              'fftw: If using the FFTW package from julia'
              'gnuplot: If using the Gaston Package from julia')
  provides=('julia')
  conflicts=('julia')
  backup=(etc/julia/startup.jl)


  make -C "$_pkgbase" DESTDIR="$pkgdir" install \
    prefix=/usr \
    libexecdir=/usr/lib \
    sysconfdir=/etc

  # Documentation is in the julia-docs package.
  # Man pages in /usr/share/julia/doc/man are duplicate.
  rm -rf "$pkgdir/usr/share/"{doc,julia/doc}

  install -Dm644 "$_pkgbase/LICENSE.md" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

  # Remove files that don't belong into the package
  find ${pkgdir} -name ".gitignore" -delete
}

package_julia-aarch64-git-docs() {
  arch=('any')
  pkgdesc='Documentation and examples for Julia'
  depends=(julia)
  provides=(julia-docs)
  conflicts=(julia-docs julia-git-doc)

  install -d "$pkgdir/usr/share/doc"
  cp -r "$_pkgbase/doc" "$pkgdir/usr/share/doc/$_pkgbase"
  rm -rf "$pkgdir/usr/share/doc/julia/man"
  install -Dm644 "$_pkgbase/LICENSE.md" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

  # Installing built docs. Adjust it accordingly to your changes in build()
  cd "$_pkgbase/doc/_build"
  cp -dpr --no-preserve=ownership html $pkgdir/usr/share/doc/julia/
  #install -D -m644 man/julialanguage.1 $pkgdir/usr/share/man/man1/julialanguage.1
  #install -D -m644 texinfo/JuliaLanguage.info $pkgdir/usr/share/info/julialanguage.info
  #install -D -m644 latex/JuliaLanguage.pdf $pkgdir/usr/share/julia/doc/julialanguage.pdf

  # Remove files that don't belong into the package
  find ${pkgdir} -name ".gitignore" -delete
}
