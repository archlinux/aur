# custom variables
_hkgname=charset
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-charset
pkgver=0.3.7.1
pkgrel=1
pkgdesc="Fast unicode character sets based on complemented PATRICIA tries"
url="http://github.com/ekmett/charset"
license=("BSD3")
arch=('i686' 'x86_64')
depends=("ghc"
         "haskell-semigroups"
         "haskell-array"
         "haskell-bytestring"
         "haskell-containers"
         "haskell-unordered-containers")
options=('staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
md5sums=('522caae63cc57efb9f5f3531f55e93bb')
install="${pkgname}.install"

# PKGBUILD functions

build() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    runhaskell Setup configure -O --enable-library-profiling --enable-shared \
        --prefix=/usr --docdir="/usr/share/doc/${pkgname}" \
        --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock --hoogle --html
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/${pkgname}/register.sh"
    install    -m744 unregister.sh "${pkgdir}/usr/share/haskell/${pkgname}/unregister.sh"
    install -d -m755 "${pkgdir}/usr/share/doc/ghc/html/libraries"
    ln -s "/usr/share/doc/${pkgname}/html" "${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}"
    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/${_licensefile}"
}
