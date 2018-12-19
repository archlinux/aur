# Maintainer: Chan Beom Park <cbpark@gmail.com>

_hkgname=ghc-events
pkgname=haskell-ghc-events
pkgver=0.8.0.1
pkgrel=1
pkgdesc="Parses .eventlog files emitted by GHC 6.12.1 and later. Includes the ghc-events tool permitting, in particular, to dump an event log file as text."
url="http://hackage.haskell.org/package/${_hkgname}"
arch=('x86_64')
license=('custom:BSD3')
depends=('ghc-libs')
makedepends=('ghc')
source=("https://hackage.haskell.org/package/${_hkgname}-${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('425aeb0b6d66236a9f19587aac163208d74a0246ea05d5dc709ba5e580410199c936c8950653ad60657b7a63c74e51ec865f8dfcf59f3068fd6a34a6a23e7a66')

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
