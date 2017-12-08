# Maintainer: Chan Beom Park <cbpark@gmail.com>

_hkgname=ghc-events
pkgname=haskell-ghc-events
pkgver=0.7.0
pkgrel=1
pkgdesc="Parses .eventlog files emitted by GHC 6.12.1 and later. Includes the ghc-events tool permitting, in particular, to dump an event log file as text."
url="http://hackage.haskell.org/package/${_hkgname}"
arch=('x86_64')
license=('custom:BSD3')
depends=('ghc-libs')
makedepends=('ghc')
source=("https://hackage.haskell.org/package/${_hkgname}-${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('afaa3cb31fd8bf7532e5b9badfec6dd196cc5434a6d02271c6221d622b90e51432a5c1115e598d1315d65d96b983474802bdf7944d640be4107d7b09b77760e9')

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
