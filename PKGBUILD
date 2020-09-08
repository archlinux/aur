# Maintainer: berberman <hatsue@typed.icu>

_hkgname=hackage-db
pkgname=haskell-hackage-db
pkgver=2.1.0
pkgrel=1
pkgdesc="Access cabal-install's Hackage database via Data.Map"
url="https://github.com/peti/hackage-db#readme"
license=("custom:BSD3")
arch=('x86_64')
depends=('ghc-libs' 'haskell-aeson' 'haskell-tar' 'haskell-utf8-string')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz")
sha256sums=('7458bdecb426344ced430851c95ef5901b827e610063e6b32ba2acbc32054cef')

build() {
  cd $_hkgname-$pkgver    

  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/$pkgname \
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
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
