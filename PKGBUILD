# Maintainer: cbpark <cbpark@gmail.com>

_hkgname=apply-refact
pkgname=haskell-apply-refact
pkgver=0.8.2.0
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
sha512sums=('2b4a7f96ad3de93965aa1f13bf4a5bb8de1eb8708a8f32d5bd8221f913267daab0b8a82c4d799d4a0f8e5b9918d3db89e2179f2eb98116e577613cee9bfde119')

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
