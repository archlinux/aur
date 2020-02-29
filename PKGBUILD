# Maintainer: 71e6fd52 <71e6fd52 at gmail dot com>

_hkgname=data-tree-print
pkgname=haskell-data-tree-print
pkgver=0.1.0.2
pkgrel=1
pkgdesc="Print Data instances as a nested tree"
url='https://hackage.haskell.org/package/data-tree-print'
license=('BSD')
arch=('x86_64')
depends=('ghc-libs' 'haskell-pretty' 'haskell-syb')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('b2cbab62a00b78cb4b105502b75b06b3b39e23d57bf269b1fece7449041742176e49bafd4806d05001d21c1abc0dbc06c4dbd03dbe8801b4ced3311a37b29320')

prepare() {
    cd $_hkgname-$pkgver

    sed -i 's/base .*$/base/' data-tree-print.cabal
}

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
