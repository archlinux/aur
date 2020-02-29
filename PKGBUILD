# Maintainer: 71e6fd52 <71e6fd52 at gmail dot com>

_hkgname=czipwith
pkgname=haskell-czipwith
pkgver=1.0.1.2
pkgrel=1
pkgdesc="CZipWith class and deriving via TH"
url='https://hackage.haskell.org/package/czipwith'
license=('BSD')
arch=('x86_64')
depends=('ghc-libs' 'haskell-template-haskell' 'haskell-transformers')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('8902c1a3486b46d8dc7fdd7e2b5a62396d9e6f98e10c4b8872eb8fb4c3201decd54a201b30d48a7fcada7638872bc3ee018ebe9e44eeacad1871d7338337ed4d')

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
