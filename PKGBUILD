# Maintainer: Nicolas Lenz <nicolas@eisfunke.com>

pkgname=haskell-mock
pkgver=3.7.1
pkgrel=1
pkgdesc="Great Haskell tool to transform text"
url="https://git.eisfunke.com/software/mock"
license=("custom:WTFPL")
arch=("x86_64")
depends=("haskell-array" "haskell-base" "haskell-binary" "haskell-bytestring" "haskell-deepseq" "haskell-ghc-prim" "haskell-hashable" "haskell-integer-gmp" "haskell-random" "haskell-text" "haskell-time")
makedepends=("ghc" "haskell-hpack")
source=("${pkgname}-${pkgver}.tar.gz::https://git.eisfunke.com/software/mock/-/archive/${pkgver}/mock-${pkgver}.tar.gz")
sha256sums=('ca3342dc5ae0775630913509004f949b220fbe73993026806f80f83fc7c4dc21')


build() {
    cd "${srcdir}/mock-${pkgver}"

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
    cd "${srcdir}/mock-${pkgver}"

    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
    install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"

    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
