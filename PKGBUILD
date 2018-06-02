# Maintainer: cbpark <cbpark@gmail.com>

_hkgname=apply-refact
pkgname=haskell-apply-refact
pkgver=0.5.0.0
pkgrel=1
pkgdesc="Perform refactorings specified by the refact library"
url="https://hackage.haskell.org/package/${_hkgname}"
arch=('x86_64')
license=("custom:BSD3")
depends=('ghc-libs'
         'haskell-filemanip'
         'haskell-ghc-exactprint'
         'haskell-optparse-applicative'
         'haskell-refact'
         'haskell-syb'
         'haskell-transformers-base'
         'haskell-temporary'
         'haskell-unix-compat')
makedepends=('ghc')
source=("https://hackage.haskell.org/package/${_hkgname}-${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('8a3b4a8e1952fc4a420763775b7ca6641364c0445e84b9b8e81297cddb34239557202951abeb90434faea938d9a9eb7cf99600d19db235725bb82cccd9667f30')

build() {
    cd "${srcdir}/${_hkgname}-${pkgver}"

    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir="/usr/share/doc/${pkgname}" --datasubdir="$pkgname" \
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
