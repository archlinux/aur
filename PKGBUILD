# $Id$
# Maintainer: Damir Jelić <poljar@termina.org.uk>

_hkgname=typed-process
pkgname=haskell-typed-process
pkgver=0.1.1
pkgrel=2
pkgdesc="Run external processes, with strong typing of streams."
url="https://github.com/fpco/typed-process"
license=("MIT")
arch=('i686' 'x86_64')
depends=('haskell-base' 'haskell-async' 'haskell-bytestring' 'haskell-conduit'
         'haskell-conduit-extra' 'haskell-exceptions' 'haskell-process'
         'haskell-stm' 'haskell-transformers')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-${pkgver}.tar.gz")
sha512sums=('f270e0f2213bdc2c61a0a781880cba9c869e29dabc8727fcfc252a2bc9646ec348d07bc5e570a6eb28fb72b4c92063cf631c8fd0987149e44a9678850018062a')

build() {
    cd "${srcdir}/${_hkgname}-${pkgver}"

    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir="/usr/share/doc/${pkgname}" \
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
