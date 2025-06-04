# Maintainer: MajorX234 <majorx234 at gmail dot com>
# Contributor: Emanuel Couto <unit73e at gmail dot com>
# Contributor: Daniel Nagy <danielnagy at gmx de>

_hkgname=OpenGL
pkgname=haskell-opengl
pkgver=3.0.3.0
pkgrel=2
pkgdesc="A binding for the OpenGL graphics system"
url="http://www.haskell.org/haskellwiki/Opengl"
license=('custom:BSD3')
arch=('i686' 'x86_64')
depends=('ghc-libs' 'haskell-gluraw' 'haskell-objectname' 'haskell-openglraw'
         'haskell-statevar' 'haskell-text' 'haskell-transformers')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('1ccd11095d5d36346bd22c8ebeab3b9bcb267744d6c3ddfe3c76dc2ed620493d688353a778454a053c710464db0de8228823a95f63dfae5784c2f1ca931b0ae9')

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
