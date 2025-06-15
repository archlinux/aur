# Maintainer: Max <ulidtko@gmail.com>

_hkgname=extensions
pkgname=haskell-extensions
pkgver=0.1.0.0
pkgrel=2
#-- NOTE: 0.1.0.1 and later is incompatible with GHC 9.4.8.
#-- See https://github.com/kowainik/extensions/issues/111

pkgdesc="Parse Haskell Language Extensions"
url="https://github.com/kowainik/extensions"
license=("MPL-2.0")
arch=('x86_64')
depends=('ghc-libs' 'haskell-colourista' 'haskell-optparse-applicative')
makedepends=(ghc haskell-hedgehog haskell-hspec haskell-hspec-hedgehog uusi)
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz"
        )
sha256sums=('ac1fb10ff40f500cec8de62426d056d5719b5e3efcdd2fb907934224048f9cac')

prepare() {
  cd "$_hkgname-$pkgver"
}

build() {
  cd $_hkgname-$pkgver
  gen-setup && uusi --all $_hkgname.cabal

  runhaskell Setup configure -O \
    --enable-shared --enable-executable-dynamic --disable-library-vanilla \
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

check() {
  cd $_hkgname-$pkgver
  runhaskell Setup test
}

package() {
  cd $_hkgname-$pkgver

  install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
  install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}
