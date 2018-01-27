# Maintainer: Leif Warner <abimelech@gmail.com>

# custom variables
_hkgname=io-storage

# PKGBUILD options/directives
pkgname=haskell-io-storage
pkgver=0.3
pkgrel=1
license=(BSD3)
pkgdesc="A key-value store in the IO monad."
url="http://github.com/willdonnelly/io-storage"
arch=('i686' 'x86_64')
depends=("ghc")
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")

sha256sums=("9a0df5cc7ff2eeef11e29e1362fea284f535bc2fe67469bba6dbc41c4f5b49bd")

# PKGBUILD functions

build() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir="/usr/share/doc/${pkgname}" \
        --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    install -Dm 744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
    install -Dm 744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"

    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
