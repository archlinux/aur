# Maintainer: berberman <hatsue@typed.icu>

_hkgname=microaeson
pkgname=haskell-microaeson
pkgver=0.1.0.0
pkgrel=1
pkgdesc="A tiny JSON library with light dependency footprint."
url="https://github.com/haskell-hvr/microaeson"
license=('GPL3')
arch=('x86_64')
depends=('ghc-libs')
makedepends=('ghc' 'alex' 'haskell-aeson' 'haskell-quickcheck' 'haskell-quickcheck-instances' 'haskell-vector' 'haskell-tasty' 'haskell-tasty-quickcheck' 'haskell-unordered-containers')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz")
sha256sums=('3f9e852e8985e9313ec260afaddecb7d6b202e6e1778010b6ad6ea74cdf777c1')

prepare(){
  cd $_hkgname-$pkgver

  sed -i '/ ^>= 4.11.0.0/a\                             || ^>= 4.14.0.0' $_hkgname.cabal
  sed -i '/ ^>= 4.11.0.0/a\                             || ^>= 4.13.0.0' $_hkgname.cabal
  sed -i '/ ^>= 4.11.0.0/a\                             || ^>= 4.12.0.0' $_hkgname.cabal
  sed -i '/ ^>= 0.5.6.2/a\                             || ^>= 0.6.0.1' $_hkgname.cabal
  sed -i 's/ ^>= 1.3.1.0/^>= 1.5/' $_hkgname.cabal
  sed -i 's/ ^>= 2.11.3/^>= 2.14/' $_hkgname.cabal
  sed -i 's/ ^>= 1.0.1.1/^>= 1.3/' $_hkgname.cabal
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
 
