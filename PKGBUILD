# $Id$
# Maintainer: Emanuel Couto <unit73e at gmail dot com>

_hkgname=sdl2
pkgname=haskell-sdl2
pkgver=2.3.0
pkgrel=1
pkgdesc="Bindings to the SDL 2 library"
url="http://hackage.haskell.org/package/sdl2"
license=('custom:BSD3')
arch=('i686' 'x86_64')
depends=('ghc-libs' 'haskell-exceptions' 'haskell-linear' 'haskell-opengl' 'haskell-statevar'
         'haskell-text' 'haskell-transformers' 'haskell-vector' 'sdl2')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('2861c4e4730c0caab841424fdea1bc7f67b9f6d4771d80369795810879cd7f560a27f33c44ead0cb80e16b7212e6326acf8a2986c95258ac570de910777e85bb')

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
