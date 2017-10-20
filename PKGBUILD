# $Id$
# Maintainer: Emanuel Couto <unit73e at gmail dot com>

_hkgname=helm
pkgname=haskell-helm
pkgver=1.0.0
pkgrel=1
pkgdesc="A functionally reactive game engine"
url="http://github.com/switchface/helm"
license=('custom:BSD3')
arch=('i686' 'x86_64')
depends=('ghc-libs' 'haskell-cairo' 'haskell-elerea' 'haskell-linear' 'haskell-mtl'
         'haskell-pango' 'haskell-random' 'haskell-sdl2' 'haskell-stm' 'haskell-text')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('a5c99bc39fdafa03277700a8197c0c125402dad05dd12a448c6d9a77c997cda2a167f0a5bc960bc55749cd45eb01b0ca01850267f246ac1fd569500c273369c0')

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
