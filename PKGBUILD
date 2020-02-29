# Maintainer: 71e6fd52 <71e6fd52 at gmail dot com>

_hkgname=monad-memo
pkgname=haskell-monad-memo
pkgver=0.5.1
pkgrel=1
pkgdesc="Memoization monad transformer"
url='https://hackage.haskell.org/package/monad-memo'
license=('BSD')
arch=('x86_64')
depends=('ghc-libs' 'haskell-quickcheck' 'haskell-array' 'haskell-containers' 'haskell-criterion' 'haskell-primitive' 'haskell-random' 'haskell-test-framework' 'haskell-test-framework-quickcheck2' 'haskell-transformers' 'haskell-transformers-compat' 'haskell-vector')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('5365069c0fd86fd3f5c080896f05c405be0e702d72dad105975ca4000b87626c63a7d6e1b147f7fa5eb292982562b107477f2fe62e0cea06cae616f6869e4932')

build() {
    cd $_hkgname-$pkgver

    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir=/usr/share/doc/$pkgname --enable-tests \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid
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
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}
