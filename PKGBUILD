# Maintainer: Chan Beom Park <cbpark@gmail.com>

_hkgname=ghc-exactprint
pkgname=haskell-ghc-exactprint
pkgver=0.5.6.1
pkgrel=1
pkgdesc="Using the API Annotations available from GHC 7.10.2, this library provides a means to round trip any code that can be compiled by GHC, currently excluding lhs files."
url="https://hackage.haskell.org/package/${_hkgname}"
arch=('x86_64')
license=("custom:BSD3")
depends=('ghc-libs' 'haskell-ghc-paths' 'haskell-syb' 'haskell-free')
makedepends=('ghc' 'haskell-filemanip' 'haskell-hunit' 'haskell-diff' 'haskell-silently')
source=("https://hackage.haskell.org/package/${_hkgname}-${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('62fa9269635906696e0dfa8e33d580b4ab64dcb32725e5480a6a469c4afcb90b5f209fc62602d6104c0e9406b5fdfe755dd2b186f3398c4f3349b8cfa937cad4')

build() {
    cd "${srcdir}/${_hkgname}-${pkgver}"

    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir="/usr/share/doc/${pkgname}" --enable-tests \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid
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
