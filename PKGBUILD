# Maintainer: Chan Beom Park <cbpark@gmail.com>

_hkgname=ghc-events
pkgname=haskell-ghc-events
pkgver=0.13.0
pkgrel=1
pkgdesc="Parses .eventlog files emitted by GHC 6.12.1 and later. Includes the ghc-events tool permitting, in particular, to dump an event log file as text."
url="http://hackage.haskell.org/package/${_hkgname}"
arch=('x86_64')
license=('custom:BSD3')
depends=('ghc-libs')
makedepends=('ghc')
source=("https://hackage.haskell.org/package/${_hkgname}-${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('5957be8083a6b23e53a191b5168665f77be45f4db73f5ae03a526f871195fb927657488a70ece3a2108541daa91a829d3d281a926b1b93b50fe4605dace5dd9f')

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
