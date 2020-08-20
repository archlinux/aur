# Maintainer: berberman <hatsue@typed.icu>

_hkgname=tomland
pkgname=haskell-tomland
pkgver=1.3.0.0
pkgrel=1
pkgdesc="Implementation of bidirectional TOML serialization."
url="https://github.com/kowainik/tomland"
license=('MPL2')
arch=('x86_64')
depends=('ghc-libs' 'haskell-validation-selective' 'haskell-megaparsec' 'haskell-parser-combinators' 'haskell-unordered-containers' 'haskell-hashable')
makedepends=('ghc' 'haskell-hedgehog' 'haskell-hspec' 'haskell-hspec-golden' 'haskell-hspec-hedgehog' 'haskell-hspec-megaparsec' 'haskell-unordered-containers' 'haskell-megaparsec' 'haskell-hashable')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz"
        Setup.hs
)
sha256sums=('SKIP' 'SKIP')

prepare(){
  cd $_hkgname-$pkgver

  cp ../Setup.hs Setup.hs
  # disable executables
  sed -i '/executable/i\if false{' $_hkgname.cabal
  sed -i '/-pgmL/a\}' $_hkgname.cabal
  sed -i '/-threaded -Wall/a\}' $_hkgname.cabal
}

build() {
  cd $_hkgname-$pkgver    
    
  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --enable-tests --disable-library-vanilla \
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
 
