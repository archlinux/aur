# $Id$
# Maintainer: Emanuel Couto <unit73e at gmail dot com>
# Contributor: Carlos E. Garcia <carlos at cgarcia dot org>
_hkgname=fixed
pkgname=haskell-fixed
pkgver=0.2.1.1
pkgrel=2
pkgdesc="Signed 15.16 precision fixed point arithmetic"
url="http://github.com/ekmett/fixed"
license=('custom:BSD3')
arch=('i686' 'x86_64')
depends=('ghc-libs')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('99f0410deffbecaf4ffb15543e3fd060cc679b238644490cbb0a608dda9957fc4c0020bce667f6ca25fc02c52fced7e9ca40dabe899ec8649b522fdec75eb9c0')

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
