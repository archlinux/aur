# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>

pkgname=nixfmt
pkgver=1.4.0 # renovate: datasource=github-tags depName=NixOS/nixfmt
pkgrel=1
pkgdesc="Official formatter for Nix code"
url="https://github.com/NixOS/nixfmt"
license=("MPL-2.0")
arch=('x86_64')
depends=('ghc-libs' 'haskell-cmdargs' 'haskell-megaparsec' 'haskell-parser-combinators' 'haskell-safe-exceptions' 'haskell-scientific' 'haskell-file-embed' 'haskell-pretty-simple')
makedepends=('ghc' 'uusi')
source=("https://github.com/NixOS/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('1f099c1adbd3514c6b4e079741035e152e3d9dbbe7ab1c2b724420408704bf90ac7b70869768c1f7158e5cc8efd9976095b3ce0573cdf509c8c624be1074e354')

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
