# Maintainer: Gabriel-Andrew Pollo-Guilbert <gabrielpolloguilbert@gmail.com>

_hkgname=parsec-numbers
pkgname=haskell-$_hkgname
pkgver=0.1.0
pkgrel=1
pkgdesc="This packages provides the number parsers without the need to use a large (and unportable) token parser."
url="https://hackage.haskell.org/package/parsec-numbers"
license=("custom:BSD3")
arch=('x86_64')
depends=('ghc-libs' "haskell-parsec")
makedepends=('ghc')
source=("https://hackage.haskell.org/package/${_hkgname}-${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('8a06ef239e6fb9fabaf04d947c21b298acd9538d2f98dd2404d943c18b5f29aa0d11572be3e1a846ae3d1345fbbdc5b2803df3ec196ccc212c4d76082c930b05')

build() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    runhaskell Setup configure -O            \
        --enable-shared                      \
        --enable-executable-dynamic          \
        --disable-library-vanilla            \
        --prefix="/usr"                      \
        --docdir="/usr/share/doc/${pkgname}" \
        --dynlibdir="/usr/lib"               \
        --libsubdir="$compiler/site-local/$pkgid"

    runhaskell Setup build
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script

    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
    install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
