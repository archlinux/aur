# Maintainer: berberman <hatsue@typed.icu>

_hkgname=summoner
pkgname=haskell-summoner
pkgver=2.0.1.1
pkgrel=1
pkgdesc="Tool for scaffolding fully configured batteries-included production-level Haskell projects."
url="https://github.com/kowainik/summoner"
license=('MPL2')
arch=('x86_64')
depends=('ghc-libs' 'haskell-colourista' 'haskell-generic-data' 'haskell-gitrev' 'haskell-optparse-applicative' 'haskell-shellmet' 'haskell-tomland' 'haskell-validation-selective' 'haskell-neat-interpolation' 'haskell-aeson')
makedepends=('ghc' 'haskell-hedgehog' 'haskell-hspec' 'haskell-hspec-hedgehog' 'haskell-tree-diff')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz" Setup.hs)
sha256sums=('5b6eee2848e2fb0b65d34f4a980ecd6e7766629a42394348dc2166e2216fc496' '1e1679046e10c31286fee3e631e57e4ef60c89e562270c8a2a7131c051959916')

prepare(){
  cd $_hkgname-$pkgver
  cp ../Setup.hs Setup.hs
  sed -i 's/ ^>= 0.8.0.0/^>= 0.9.0.0/' $_hkgname.cabal
  sed -i 's/ ^>= 0.3.2.2/^>= 0.5.0.0/' $_hkgname.cabal
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

check() {
    cd $_hkgname-$pkgver
    LC_CTYPE=en_US.UTF-8 runhaskell Setup test || warning "Test failed!"
}


package() {
  cd $_hkgname-$pkgver

  install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
  install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
