# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>

pkgname=nixfmt
pkgver=0.6.0
pkgrel=5
pkgdesc="An opinionated formatter for Nix"
url="https://github.com/NixOS/nixfmt"
license=("MPL-2.0")
arch=('x86_64')
depends=('ghc-libs' 'haskell-cmdargs' 'haskell-megaparsec' 'haskell-parser-combinators' 'haskell-safe-exceptions' 'haskell-scientific')
makedepends=('ghc' 'uusi')
source=("https://github.com/NixOS/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('79abe243eec4b403a3571153f68ccbf5b3e2e342ffbe5f78318f3612ef3c073dcf5afa922276edd50a763a85463ffd617622fd2524d4fc55af7e4e8e91312325')

prepare() {
  uusi $pkgname-$pkgver/$pkgname.cabal
}

build() {
  cd $pkgname-$pkgver

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
