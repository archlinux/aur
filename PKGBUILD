# Maintainer: berberman <hatsue@typed.icu>

_hkgname=hspec-hedgehog
pkgname=haskell-hspec-hedgehog
pkgver=0.0.1.2
pkgrel=1
pkgdesc="Integrate Hedgehog and Hspec!"
url="https://github.com/parsonsmatt/hspec-hedgehog/"
license=('custom:BSD3')
arch=('x86_64')
depends=('ghc-libs' 'haskell-hspec' 'haskell-hspec-core' 'haskell-hedgehog'
    'haskell-hunit' 'haskell-quickcheck')
makedepends=('ghc' 'haskell-hspec' 'haskell-hspec-core' 'haskell-hedgehog')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz")
sha256sums=('23582ee0f9807b2e49de5da4ae8ef83cb56db63a045a7db73d537eab35c9eb9d')

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
 
