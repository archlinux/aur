# Maintainer: cbpark <cbpark@gmail.com>

_hkgname=apply-refact
pkgname=haskell-apply-refact
pkgver=0.6.0.0
pkgrel=1
pkgdesc="Perform refactorings specified by the refact library"
url="https://hackage.haskell.org/package/${_hkgname}"
arch=('x86_64')
license=("custom:BSD3")
depends=('ghc-libs'
         'haskell-filemanip'
         'haskell-ghc-exactprint>=0.5.7.0'
         'haskell-optparse-applicative'
         'haskell-refact'
         'haskell-syb'
         'haskell-transformers-base'
         'haskell-temporary'
         'haskell-unix-compat')
makedepends=('ghc')
source=("https://hackage.haskell.org/package/${_hkgname}-${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('438e384a2885e1f749eedf67a9257810f75e1b53a6e1dbe05ff09d3931ef51b6451f016933c32cd0aba84edca0839185526c4d1fb6b2bcd9fffd2d340fbae8a9')

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
