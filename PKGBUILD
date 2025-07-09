# Maintainer: MajorX234 <majorx234 at gmail dot com>

_hkgname=gloss-rendering
pkgname=haskell-gloss-rendering
pkgver=1.13.2.1
pkgrel=1
pkgdesc="haskell gloss picture data types and rendering functions"
url="http://www.haskell.org/haskellwiki/gloss-rendering"
license=('MIT')
arch=('i686' 'x86_64')
depends=('ghc-libs' 'haskell-glut' 'haskell-opengl' 'haskell-bmp')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('f050846234aef3cbe123f347bb3dd34c8797071305015a3ee431fdca97c7fdbe0e4fe7878dd70d3968fba5e09a2723a7d28e40fd2f9f452a7884548be4a90a96')

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
