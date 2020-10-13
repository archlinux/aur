_hkgname=HsSyck
pkgname=haskell-hssyck
pkgver=0.53
pkgrel=1
pkgdesc="Fast, lightweight YAML loader and dumper"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('MIT')
arch=('x86_64')
depends=("ghc"
         "haskell-syb"
         "haskell-hashtables"
         "haskell-utf8-string")
source=(https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
sha512sums=('d1750429595631d4f38264711d27becd82f8de76c5a0e0736205ed080bb92b1ea3a0cfeba33c216801b88dbd992443bae6ae4b8685b51993da3251ac0f76b8b0')

build() {
    cd $_hkgname-$pkgver    
    
    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir=/usr/share/doc/$pkgname --enable-tests \
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

