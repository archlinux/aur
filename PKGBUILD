# Maintainer: cbpark <cbpark@gmail.com>

_hkgname=apply-refact
pkgname=haskell-apply-refact
pkgver=0.3.0.0
pkgrel=3
pkgdesc="Perform refactorings specified by the refact library"
arch=('i686' 'x86_64')
url="https://hackage.haskell.org/package/${_hkgname}"
license=("custom:BSD3")
depends=("ghc=8.0.1" "haskell-refact>=0.2" "haskell-ghc-exactprint>=0.5.2" "haskell-syb" "haskell-mtl" "haskell-transformers-base" "haskell-temporary" "haskell-filemanip" "haskell-unix-compat" "haskell-optparse-applicative")
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha256sums=('0d2a8845ed554c4a6742a3d0a130dac3f16d0d710b65b20dfeb8e773409ed70f')

build() {
    cd "${srcdir}/${_hkgname}-${pkgver}"

    sed -i '28 i import Data.Semigroup ((<>))' src/Main.hs

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
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
