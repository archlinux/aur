# Maintainer: Sergey Khorev <sergey.khorev@gmail.com>
_hkgname=cabal-install
pkgname=cabal-install-git
pkgver=20130901
pkgrel=1
pkgdesc="The command-line interface for Cabal and Hackage (a standalone version, not clobbering standard cabal-install)"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedepends=('ghc' 'haskell-cabal' 'haskell-http' 'haskell-array' 'haskell-bytestring' 'haskell-containers' 'haskell-directory' 'haskell-filepath' 'haskell-mtl' 'haskell-network' 'haskell-pretty' 'haskell-process' 'haskell-random' 'haskell-stm' 'haskell-time' 'haskell-unix' 'haskell-zlib' 'haskell-array' 'haskell-deepseq')
depends=('git' 'gmp')
options=('strip')
groups=('devel')

_gitroot=https://github.com/haskell/cabal.git
_gitname=cabal

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"

  cd "$srcdir/$_gitname-build/Cabal"
  ghc-pkg init ../local-package-db
  runhaskell Setup configure --package-db=../local-package-db
  runhaskell Setup build
  runhaskell Setup register --inplace

  cd "$srcdir/$_gitname-build/$_hkgname"
  runhaskell Setup configure --package-db=../local-package-db
  runhaskell Setup build
}

package() {
  cd "$srcdir/$_gitname-build/$_hkgname"
  install -D dist/build/cabal/cabal  $pkgdir/usr/bin/cabal-git
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
# vim:set ts=2 sw=2 et:
