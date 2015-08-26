# Maintainer: Leif Warner <abimelech@gmail.com>
# custom variables
_hkgname=lifted-async
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-lifted-async
pkgver=0.7.0.1
pkgrel=1
pkgdesc="Run lifted IO operations asynchronously and wait for their results"
url="https://github.com/maoe/lifted-async"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc"
         "haskell-async"
         "haskell-constraints"
         "haskell-lifted-base"
         "haskell-monad-control"
         "haskell-transformers-base")
options=('staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
md5sums=('7de46b959f0d4842fab0c3841229ecca')
install="${pkgname}.install"

# PKGBUILD functions

build() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    runhaskell Setup configure -O ${PKGBUILD_HASKELL_ENABLE_PROFILING:+--enable-library-profiling} --enable-shared \
        --prefix=/usr --docdir="/usr/share/doc/${pkgname}" \
        --libsubdir=\$compiler/site-local/\$pkgid \
            -fmonad-control-1
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
