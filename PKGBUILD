# Maintainer: berberman <hatsue@typed.icu>

_hkgname=constraints-extras
pkgname=haskell-constraints-extras
pkgver=0.3.0.2
pkgrel=1
pkgdesc="Utility package for constraints"
url="https://github.com/obsidiansystems/constraints-extras"
license=("custom: BSD3")
arch=('x86_64')
depends=('ghc-libs' 'haskell-aeson' 'haskell-constraints')
makedepends=('ghc' 'uusi')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz")
sha256sums=('dac7cdd1e7bdaebdfe57550da84298f57cf2f41b3573ac39dd077f6c1a2d73d8')

prepare() {
  cd $_hkgname-$pkgver
  uusi -u base -u constraints -u template-haskell $_hkgname.cabal
}

build() {
  cd $_hkgname-$pkgver

  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/$pkgname --enable-tests \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option='-pie'

  runhaskell Setup build
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
  cd $_hkgname-$pkgver

  install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
  install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}
