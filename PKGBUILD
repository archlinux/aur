# $Id$
# Maintainer: Emanuel Couto <unit73e at gmail dot com>
# Contributor: Daniel Nagy <danielnagy at gmx de>

_hkgname=ObjectName
pkgname=haskell-objectname
pkgver=1.1.0.1
pkgrel=1
pkgdesc="Explicitly handled object names"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
depends=('ghc-libs' 'haskell-transformers')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('e0b94813d29ccba4a54c699e039ab101039a9482f594c990547a04f9de511e4d27d5a93fc5f176ea5e3a8d940d31477f0e69dcd6f7c867f67bb117933d2cce64')

build() {
    cd ${srcdir}/${_hkgname}-${pkgver}

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
