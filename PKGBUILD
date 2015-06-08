# Maintainer: Daniel Nagy <danielnagy at gmx de>

# custom variables
_hkgname=data-accessor
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-data-accessor
pkgver=0.2.2.6
pkgrel=1
pkgdesc="Utilities for accessing and manipulating fields of records"
url="http://www.haskell.org/haskellwiki/Record_access"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc"
         "sh"
         "haskell-array"
         "haskell-containers"
         "haskell-transformers")
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha256sums=('ee9de7fd9716f2681695deffcd04045d605bd24f0f2c7d6f0849dc4ae9c3c818')
install="${pkgname}.install"

# PKGBUILD functions
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    
    runhaskell Setup configure -O -p --enable-split-objs --enable-shared \
        --prefix=/usr --docdir=/usr/share/doc/${pkgname} \
        --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    install -D -m744 register.sh   ${pkgdir}/usr/share/haskell/${pkgname}/register.sh
    install    -m744 unregister.sh ${pkgdir}/usr/share/haskell/${pkgname}/unregister.sh
    install -d -m755 ${pkgdir}/usr/share/doc/ghc/html/libraries
    ln -s /usr/share/doc/${pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}
    runhaskell Setup copy --destdir=${pkgdir}
    install -D -m644 ${_licensefile} ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/${_licensefile}
}
