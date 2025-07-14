# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>

pkgname=nixfmt
pkgver=1.0.0
pkgrel=1
pkgdesc="Official formatter for Nix code"
url="https://github.com/NixOS/nixfmt"
license=("MPL-2.0")
arch=('x86_64')
depends=('ghc-libs' 'haskell-cmdargs' 'haskell-megaparsec' 'haskell-parser-combinators' 'haskell-safe-exceptions' 'haskell-scientific' 'haskell-file-embed' 'haskell-pretty-simple')
makedepends=('ghc' 'uusi')
source=("https://github.com/NixOS/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('7e6a8635d0c444584e4728f50445fc07d91c1f540de920625be7ad74c7084ce7a094e3a78b898659df3c3b2e263d944653b08d458009198faa6a016b85b3b4b0')

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
