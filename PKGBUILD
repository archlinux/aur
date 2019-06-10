# Maintainer: Nicolas Lenz <nicolas@eisfunke.com>

pkgname=haskell-mock
pkgver=3.5.0
pkgrel=1
pkgdesc="Great Haskell tool to transform text"
url="https://git.eisfunke.com/software/mock"
license=("custom:WTFPL")
arch=("x86_64")
depends=("haskell-array" "haskell-base" "haskell-binary" "haskell-bytestring" "haskell-deepseq" "haskell-ghc-prim" "haskell-hashable" "haskell-integer-gmp" "haskell-random" "haskell-text" "haskell-time")
makedepends=("ghc")
source=("${pkgname}-${pkgver}.tar.gz::https://git.eisfunke.com/software/mock/archive/v${pkgver}.tar.gz")
sha256sums=("995418b41413387a32794da6ca03a48901aa417c4c47e8c56b919c12b06e168c")


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
