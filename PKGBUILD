# Maintainer: MajorX234 <majorx234 at gmail dot com>

_hkgname=gloss
pkgname=haskell-gloss
pkgver=1.13.2.2
pkgrel=1
pkgdesc="Gloss hides the pain of drawing simple vector graphics behind a nice data type and a few display functions"
url="https://github.com/benl23x5/gloss"
license=('MIT')
arch=('i686' 'x86_64')
depends=('ghc-libs' 'haskell-gloss-rendering' 'haskell-glut' 'haskell-glfw-b' 'haskell-opengl' 'haskell-bmp')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('072588698ca7fa956fd59ee253394819526b09f43dbec80c1e371fab8c90c333d913692cebaed5823476fef5af19ccc1849531c7fe36379f0fcc3ea79a032725')

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
