# Maintainer: George Stelle <stelleg@gmail.com>
# Contributor: George Stelle <stelleg@gmail.com>

_hkgname=llvm-hs-pretty
pkgname=haskell-${_hkgname}
pkgver=0.9.0.0
pkgrel=1
pkgdesc="A pretty printer for LLVM IR."
url="https://hackage.haskell.org/package/${_hkgname}"
license=("BSD")
arch=('x86_64')
depends=('ghc-libs' 'haskell-llvm-hs-pure' 'haskell-prettyprinter')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz"
        "setup.patch")
sha512sums=('fe684ef4038e16f1de24052138fd468661e86bda6390eff3ffb82325b603863df07a92f08870b9248fe7252bf451184804479e28d38dff4981bbd18f85e58f9d'
            '1c8ce110f9a34e8d067ccb844d75c7432c3a237c08d6f2761bd7a57cb7e30a08de6bc5ccf0f1dfc8dad44209f476854f2b41b65678805102dd589190b8c2b224')

prepare() {
    cd $_hkgname-$pkgver
    patch --forward --strip=1 --input="${srcdir}/setup.patch"
}

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
