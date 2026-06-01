# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>

pkgname=nixfmt
pkgver=1.3.1 # renovate: datasource=github-tags depName=NixOS/nixfmt
pkgrel=1
pkgdesc="Official formatter for Nix code"
url="https://github.com/NixOS/nixfmt"
license=("MPL-2.0")
arch=('x86_64')
depends=('ghc-libs' 'haskell-cmdargs' 'haskell-megaparsec' 'haskell-parser-combinators' 'haskell-safe-exceptions' 'haskell-scientific' 'haskell-file-embed' 'haskell-pretty-simple')
makedepends=('ghc' 'uusi')
source=("https://github.com/NixOS/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('18c47aaa56b33c3e87b4b1eb13ebbc7cd00df378e95c3fd868b6a45f06abb8d061047005bd9785f7f0d20c395956b167a592b34e3cb378c3432572c10a8aa845')

prepare() {
  uusi $pkgname-$pkgver/$pkgname.cabal
}

build() {
  cd $pkgname-$pkgver

  gen-setup
  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/$pkgname --datasubdir=$pkgname --enable-tests \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option='-pie'

  runhaskell Setup build
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

check() {
  cd $pkgname-$pkgver
  runhaskell Setup test
}

package() {
  cd $pkgname-$pkgver

  install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
  install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}
