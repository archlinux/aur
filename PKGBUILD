# Maintainer: Tharre <tharre3@gmail.com>

_hkgname=tasty-hspec
pkgname=haskell-tasty-hspec
pkgver=1.1.5.1
pkgrel=2
pkgdesc="Hspec provider for the Tasty test framework."
url="https://github.com/mitchellwrosen/tasty-hspec"
license=("BSD")
arch=('x86_64')
depends=('ghc-libs' 'haskell-tasty' 'haskell-tasty-quickcheck'
         'haskell-tasty-smallcheck' 'haskell-hspec' 'haskell-hspec-core')
makedepends=('ghc')
source=(
    "https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz"
    "https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}.cabal"
)
sha256sums=('fe889ec0f7b3991c46a07d9ff9cf09608a73a18f434a7480d2a09c79e56f3345'
            '531ba79ad1aa8d8c12ca1ae27b6e8125d1d768d98ca5487fe6348b2c34e4f7fa')

prepare() {
    cd $_hkgname-$pkgver

    ln -sf "../${_hkgname}.cabal" .
}

build() {
    cd $_hkgname-$pkgver

    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir=/usr/share/doc/$pkgname \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid
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
