# Maintainer: Pochang Chen <johnchen902@gmail.com>
_hkgname=numbers
pkgname=haskell-numbers
pkgver=3000.2.0.2
pkgrel=1
pkgdesc="Various number types"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:BSD3')
arch=('x86_64')
depends=('ghc-libs')
makedepends=('ghc')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
sha256sums=('f0cee40b90c3746bd0bc0559d3827d3cf1b1e2c43270b7ec9bf4fa458fcb5a77')

prepare() {
    cd $_hkgname-$pkgver
    sed -i '/semigroups/d' $_hkgname.cabal
}

build() {
    cd $_hkgname-$pkgver
    
    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir=/usr/share/doc/$pkgname \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
            -f-j -ftrustworthy -f-safe -ftest-templates -ftest-properties -ftest-hunit \
            -ftest-doctests -f-dump-splices -f-old-inline-pragmas -finlining \
            -f-benchmark-uniplate
    runhaskell Setup build
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
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
