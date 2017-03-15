# Maintainer: Chan Beom Park <cbpark@gmail.com>

_hkgname=megaparsec
pkgname=haskell-megaparsec
pkgver=5.2.0
pkgrel=1
pkgdesc="This is industrial-strength monadic parser combinator library. Megaparsec is a fork of Parsec library originally written by Daan Leijen."
arch=('i686' 'x86_64')
url="https://hackage.haskell.org/package/${_hkgname}"
license=('custom:BSD2')
depends=('ghc>=8.0.1'
         'haskell-exceptions>=0.6'
         'haskell-mtl>=2.0'
         'haskell-quickcheck>=2.7'
         'haskell-scientific>=0.3.1'
         'haskell-text>=0.2'
         'haskell-transformers-base>=0.4')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha256sums=('c250a7ae2365e96df8f1061d28c7d04e5a1695395ea87055f36e3f3a57e90408')

build() {
    cd "${srcdir}/${_hkgname}-${pkgver}"

    runhaskell Setup configure -O --enable-library-profiling --enable-shared \
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
    install -D -m644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE.md"
}
