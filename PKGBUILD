# Maintainer: Nicolas Lenz <nicolas@eisfunke.com>

pkgname=haskell-mock
pkgver=3.1.0
pkgrel=1
pkgdesc="Great Haskell tool to transform text"
url="https://git.eisfunke.com/software/mock"
license=("custom:WTFPL")
arch=("x86_64")
depends=("haskell-base" "haskell-random" "haskell-time")
makedepends=("ghc")
source=("${pkgname}-${pkgver}.tar.gz::https://git.eisfunke.com/software/mock/archive/v${pkgver}.tar.gz")
sha256sums=("1cca686ec8ea2712dbc6522a9dd94454c779c995c05cd9f7154d359d75388e6b")


build() {
    cd "${srcdir}/mock"

    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd "${srcdir}/mock"

    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
    install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"

    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
