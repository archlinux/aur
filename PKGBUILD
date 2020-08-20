 # Maintainer: berberman <hatsue@typed.icu>

_hkgname=validation-selective
pkgname=haskell-validation-selective
pkgver=0.1.0.0
pkgrel=1
pkgdesc="Lighweight pure data validation based on Applicative and Selective functors."
url="https://github.com/kowainik/validation-selective"
license=('MPL2')
arch=('x86_64')
depends=('ghc-libs' 'haskell-selective')
makedepends=('ghc' 'haskell-hedgehog' 'haskell-hedgehog' 'haskell-hspec' 'haskell-hspec-hedgehog' 'haskell-doctest' 'haskell-doctest')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz"
        Setup.hs
)
sha256sums=('c7d9cb37649ff7dddfa7c97e882d86b2f2edd646ce9fa42d50f78c1098784345' '1e1679046e10c31286fee3e631e57e4ef60c89e562270c8a2a7131c051959916')

prepare(){
  cd $_hkgname-$pkgver

  cp ../Setup.hs Setup.hs
  sed -i 's/ ^>= 0.16/ ^>= 0.17/' $_hkgname.cabal
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
 
