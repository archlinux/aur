# Maintainer: he7086 <heyi7086<AT>gmail<DOT>com>

pkgname=haskell-ghc-check
_hkgname=ghc-check
pkgver=0.5.0.3
pkgrel=1
pkgdesc="detect mismatches between compile-time and run-time versions of the ghc api"
url="http://hackage.haskell.org/package/ghc-check"
license=("BSD")
arch=('x86_64')
depends=('ghc-libs' 'ghc' 'haskell-ghc-paths' 'haskell-safe-exceptions' 'haskell-transformers-base')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-${pkgver}.tar.gz")
sha512sums=('539f82616afebbcc512c546b54b2937a9603d760537e1980348290d95878b2f4c9d1a09715329d5faead3b6662477d7ebcb6c098a4dbc9c865733ef1db917cf7')

build() {
  cd $_hkgname-$pkgver
  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir=/usr/share/doc/$pkgname \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
            -f-developer -f-fast -f-cffi
  runhaskell Setup build $MAKEFLAGS
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
  cd $_hkgname-$pkgver

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
  install -Dm744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
  runhaskell Setup copy --destdir="$pkgdir"
  rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}
