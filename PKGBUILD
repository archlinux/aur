# Maintainer: 71e6fd52 <71e6fd52 at gmail dot com>

_hkgname=strict-list
pkgname=haskell-strict-list
pkgver=0.1.5
pkgrel=1
pkgdesc='Strict linked list'
url='https://hackage.haskell.org/package/strict-list'
license=('MIT')
arch=('x86_64')
depends=('ghc-libs' 'haskell-hashable' 'haskell-semigroupoids' 'haskell-quickcheck' 'haskell-quickcheck-instances' 'haskell-rerebase' 'haskell-tasty' 'haskell-tasty-hunit' 'haskell-tasty-quickcheck')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('05482a8472641883c810dcaf154cc0ff435f40933d80674f162238b74208801dee8b6ba24a82765308683081e402db6d331b9e57aa5dd02853e67ad8c263f02a')

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
