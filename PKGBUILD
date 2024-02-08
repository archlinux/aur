# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Alexander Schmidt <zyeryi@gmail.com>

_name=erd
pkgname=erd-git
pkgver=0.2.1.0.r18.gd3c8406
pkgrel=6
pkgdesc='A utility for generating entity-relationship diagrams from plain-text descriptions - git version'
arch=('x86_64')
url="https://github.com/BurntSushi/$_name"
license=('Unlicense')
depends=('ghc-libs' 'haskell-gitrev' 'haskell-graphviz' 'haskell-raw-strings-qq' 'haskell-yaml')
makedepends=('ghc' 'git')
checkdepends=('haskell-tasty' 'haskell-tasty-hunit')
provides=('erd')
conflicts=('erd')
source=("git+$url.git")
sha256sums=('SKIP')
options=('!emptydirs')

pkgver() {
  cd "$_name"

  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_name"

  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir="/usr/share/doc/$pkgname" --datasubdir=$pkgname --enable-tests \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option='-pie'

  runhaskell Setup build $MAKEFLAGS
}

check() {
  cd "$_name"

  runhaskell Setup test
}

package() {
  cd "$_name"

  runhaskell Setup copy --destdir="$pkgdir"
  rm -f "$pkgdir/usr/share/doc/$pkgname/UNLICENSE"
}
