# Maintainer: Chan Beom Park <cbpark@gmail.com>

_hkgname=doctest
pkgname=haskell-doctest
pkgver=0.11.3
pkgrel=1
pkgdesc="The doctest program checks examples in source code comments. It is modeled after doctest for Python"
url="https://hackage.haskell.org/package/${_hkgname}"
arch=('i686' 'x86_64')
license=("MIT")
depends=("ghc>=7.10.2"
         "haskell-base-compat>=0.7.0"
         "haskell-syb>=0.3"
         "haskell-code-page>=0.1"
         "haskell-ghc-paths>=0.1.0.9"
         "haskell-transformers-base")
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha256sums=('dac79091b8dcbb62cc9583a5189177fcccc886a5be9759bc78090da6375b7848')

build() {
    cd "${srcdir}/${_hkgname}-${pkgver}"

    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic \
        --prefix=/usr --docdir="/usr/share/doc/${pkgname}" \
        --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock --hoogle --html
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd "${srcdir}/${_hkgname}-${pkgver}"

    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
    install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
    install -d -m755 "${pkgdir}/usr/share/doc/ghc/html/libraries"
    ln -s "/usr/share/doc/${pkgname}/html" "${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}"
    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"

    # Remove static libs
    find "$pkgdir"/usr/lib -name "*.a" -delete
}
