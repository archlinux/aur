# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=dhall-toml
pkgver=1.0.1
pkgrel=1
pkgdesc="Convert between Dhall and TOML"
url="https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-toml"
license=("custom: BSD3")
arch=('x86_64')
depends=('ghc-libs' 'dhall' 'haskell-prettyprinter' 'haskell-tomland' 'haskell-unordered-containers')
makedepends=('ghc' 'uusi' 'haskell-doctest' 'haskell-tasty' 'haskell-tasty-hunit')
source=("https://hackage.haskell.org/packages/archive/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('6b55ca62520ce4405ffd6eb8afb76b2df8eb5d2c086eb3a93c38a3c9298d8c08')

prepare() {
  cd $pkgname-$pkgver

  gen-setup
}

build() {
  cd $pkgname-$pkgver

  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/$pkgname --enable-tests \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid --ghc-option=-fllvm \
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
