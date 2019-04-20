# Maintainer: j605
pkgname=haskell-titlecase
_pkgname=titlecase
pkgver=1.0.1
pkgrel=1
pkgdesc='Convert English words to title case'
url='https://github.com/peti/titlecase#readme'
license=('BSD')
arch=('x86_64')
depends=('ghc-libs'
         'haskell-tasty'
         'haskell-tasty-hunit'
         'haskell-tasty-quickcheck')
makedepends=('ghc')
source=("https://hackage.haskell.org/package/$_pkgname-$pkgver/$_pkgname-$pkgver.tar.gz")
sha512sums=('9cc6af3b836eb0d07c7de83c224875469971f757ca8f14029d9a198eba4f49ddbb18e03882f0aeec6eb66c065e9822af909d960b1f33744a235fc4dea76869a8')

build() {
    cd $_pkgname-$pkgver

    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir="/usr/share/doc/${pkgbase}" --datasubdir="$pkgname" --enable-tests \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
            -f-trypandoc -f-embed_data_files -f-static
    runhaskell Setup build
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd $_pkgname-$pkgver
    install -Dm744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
    install -Dm744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
    install -Dm644 LICENSE       "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    runhaskell Setup copy --destdir="${pkgdir}"
}
