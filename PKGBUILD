# Maintainer: berberman <hatsue@typed.icu>

_hkgname=summoner-tui
pkgname=haskell-summoner-tui
pkgver=2.0.1.1
pkgrel=1
pkgdesc="Tool for scaffolding fully configured batteries-included production-level Haskell projects using TUI."
url="https://github.com/kowainik/summoner"
license=('MPL2')
arch=('x86_64')
depends=('ghc-libs' 'haskell-summoner' 'haskell-microlens' 'haskell-microlens-th' 'haskell-vty' 'haskell-brick')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz" Setup.hs)
sha256sums=('9f840f25d72c54b4b5ed0c5e6755e52ca71e9961759de6bd0046d567bd1f2c27' '1e1679046e10c31286fee3e631e57e4ef60c89e562270c8a2a7131c051959916')

prepare(){
  cd $_hkgname-$pkgver
  cp ../Setup.hs Setup.hs
  sed -i 's/ >= 5.25 && < 5.29/^>= 5.30/' $_hkgname.cabal
  sed -i 's/ >= 0.47 && < 0.55/^>= 0.55/' $_hkgname.cabal
}

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
 
