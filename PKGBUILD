# Maintainer: Nicolas Lenz <nicolas@eisfunke.com>

pkgname=haskell-mock
pkgver=3.6.0
pkgrel=1
pkgdesc="Great Haskell tool to transform text"
url="https://git.eisfunke.com/software/mock"
license=("custom:WTFPL")
arch=("x86_64")
depends=("haskell-array" "haskell-base" "haskell-binary" "haskell-bytestring" "haskell-deepseq" "haskell-ghc-prim" "haskell-hashable" "haskell-integer-gmp" "haskell-random" "haskell-text" "haskell-time")
makedepends=("ghc" "haskell-hpack")
source=("${pkgname}-${pkgver}.tar.gz::https://git.eisfunke.com/software/mock/archive/v${pkgver}.tar.gz")
sha256sums=("6edbc02f09db2107bd61c468c2ddd549e4d4ba5f9dcba79da320c2ed14b5c106")


build() {
    cd "${srcdir}/mock"

    hpack
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
