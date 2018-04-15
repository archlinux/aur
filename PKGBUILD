# Maintainer: Leif Warner <abimelech@gmail.com>

# custom variables
_hkgname=tuple

pkgname=haskell-${_hkgname}
pkgver=0.3.0.2
pkgrel=1
license=(BSD-3-Clause)
pkgdesc="Various useful functions on tuples, overloaded on tuple size." 
url="http://hackage.haskell.org/package/${_hkgname}"
arch=('x86_64')
makedepends=("ghc")
depends=("haskell-onetuple")
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")

sha256sums=('2fcb068ffafbe64170e02094a363f83d1725f44f8af963d9dad943a592e89624')

# PKGBUILD functions

build() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    runhaskell Setup configure -O --enable-executable-dynamic --disable-library-vanilla --enable-shared \
        --prefix=/usr --docdir="/usr/share/doc/${pkgname}" --datasubdir="$pkgname" \
        --libsubdir=\$compiler/site-local/\$pkgid --dynlibdir=/usr/lib
    runhaskell Setup build
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
}

package() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
    install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"

    runhaskell Setup copy --destdir="${pkgdir}"

    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
