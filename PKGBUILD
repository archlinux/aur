# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Arch Haskell Team <arch-haskell@haskell.org>

_hkgname=MissingH
pkgname=haskell-missingh
pkgver=1.4.2.1
pkgrel=1
pkgdesc="Large utility library"
url="http://software.complete.org/missingh"
license=("BSD")
arch=('x86_64')
depends=('ghc-libs' "haskell-hslogger" "haskell-network"
         "haskell-old-locale" "haskell-old-time" "haskell-random"
         "haskell-regex-compat")
makedepends=('ghc' 'haskell-hunit')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('4e8adc6d20b1aadc25db45789b98df5b9bf0f6763b5a7e291c3107f9ff229070af97f3e8c2cdb54ca8b308c92ba35b13e237da9aed2fb66badb2fd750b6ca9f3')

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
