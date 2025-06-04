# $Id$
# Maintainer: MajorX234 <majorx234 at gmail dot com>
# Maintainer: Emanuel Couto <unit73e at gmail dot com>
# Maintainer: Carlos E. Garcia <carlos at cgarcia dot org>

_hkgname=OpenGLRaw
pkgname=haskell-openglraw
pkgver=3.3.4.1
pkgrel=2
pkgdesc="A raw binding for the OpenGL graphics system"
url="http://hackage.haskell.org/package/${_hspkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
depends=('ghc-libs' 'libgl' 'haskell-fixed' 'haskell-half' 'haskell-text' 'haskell-transformers-base')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('70aed435bc254973f372c1a20181da98b18b383c99e129efbcc8f0deb5597eee05dfbe3358f2ef09b83689427410447da59b70bd7f7ad0f156e4cd140452a8cf')

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
