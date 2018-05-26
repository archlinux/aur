# Maintainer: Leif Warner <abimelech@gmail.com>

# custom variables
_hkgname=HStringTemplate

# PKGBUILD options/directives
pkgname=haskell-hstringtemplate
pkgver=0.8.7
pkgrel=1
license=(BSD3)
pkgdesc="StringTemplate implementation in Haskell."
url="http://hackage.haskell.org/package/${_hkgname}"
arch=('i686' 'x86_64')
depends=("ghc"
         "haskell-blaze-builder"
         "haskell-mtl"
         "haskell-old-locale"
         "haskell-parsec"
         "haskell-syb"
         "haskell-text"
         "haskell-void")
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")

sha256sums=('4f4ea4aa2e45e7c45821b87b0105c201fbadebc2f2d00c211e728403a0af6b0e')

# PKGBUILD functions

build() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir="/usr/share/doc/${pkgname}" \
        --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd "${srcdir}/${_hkgname}-${pkgver}"

    install -Dm 744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
    install -Dm 744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
    
    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
