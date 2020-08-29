# Maintainer: George Stelle <stelleg@gmail.com>

_hkgname=llvm-hs
pkgname=haskell-${_hkgname}
pkgver=9.0.1
pkgrel=1
pkgdesc="General purpose LLVM bindings"
url="https://hackage.haskell.org/package/${_hkgname}"
license=("BSD")
arch=('x86_64')
depends=('ghc-libs' 'haskell-attoparsec' 'haskell-llvm-hs-pure'
         'haskell-transformers-base' 'haskell-unordered-containers' 'llvm9') 
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('950e3677521d8398e02b03c043f4ccaa74bcd9e3594010e7167f0c68199adc78f5e1dea9dc62e7fa300c10daf96fe5fc68b20257af185d47e2f16fa0fe62dd1d')

build() {
    cd $_hkgname-$pkgver
    
    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir=/usr/share/doc/$pkgname \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build $MAKEFLAGS
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
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}
