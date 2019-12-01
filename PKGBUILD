pkgname=haskell-latex-formulae-hakyll
_hkgname=latex-formulae-hakyll
pkgver=0.2.0.4
pkgrel=2
pkgdesc="A library for rendering LaTeX formulae as images using an actual LaTeX installation"
url="https://hackage.haskell.org/package/latex-formulae-hakyll"
license=('BSD')
arch=('x86_64' 'i686' 'aarch64')
depends=('ghc-libs'
         'haskell-hakyll'
         'haskell-latex-formulae-image'
         'haskell-latex-formulae-pandoc'
         'haskell-lrucache'
         'haskell-pandoc-types')
makedepends=('ghc')
source=(${pkgname}-${pkgver}.tar.gz::"https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz"
        cabal.patch)
sha256sums=('ae300d1e29d392f88961719b3a2429c14a2337295d2f9b47cc6850ccd8b82660'
            '4a9bf875694bbfb7dd5e2aed61bc07b3da7d7c1f4d29bf3537e40ca432f03b2b')

prepare() {
    cd ${_hkgname}-${pkgver}
    patch --forward --strip=1 --input="${srcdir}/cabal.patch"
}

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
