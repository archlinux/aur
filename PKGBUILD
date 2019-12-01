pkgname=haskell-latex-formulae-pandoc
_hkgname=latex-formulae-pandoc
pkgver=0.2.0.6
pkgrel=2
pkgdesc="Render LaTeX formulae in pandoc documents to images with an actual LaTeX installation"
url="https://hackage.haskell.org/package/latex-formulae-pandoc"
license=('BSD')
arch=('x86_64' 'i686' 'aarch64')
depends=('ghc-libs'
         'haskell-juicypixels'
         'haskell-base64-bytestring'
         'haskell-pandoc-types'
         'haskell-latex-formulae-image')
makedepends=('ghc')
source=(${pkgname}-${pkgver}.tar.gz::"https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz"
        )
sha256sums=('2efc0b9238e237eeacdf3c24f80b7a7546175d4edcb5e86a6f6ffad4769d0c88')

build() {
    cd ${_hkgname}-${pkgver}
    runghc Setup.hs configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir="/usr/share/doc/${pkgname}" \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid
    runghc Setup.hs build
    runghc Setup.hs register --gen-script
    runghc Setup.hs unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd ${_hkgname}-${pkgver}
    runghc Setup.hs copy --destdir="${pkgdir}"
    mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
    mv "${pkgdir}/usr/share/doc/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
    install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
}
