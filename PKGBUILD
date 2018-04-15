# Maintainer: Leif Warner <abimelech@gmail.com>

# custom variables
_hkgname=multimap

pkgname=haskell-${_hkgname}
pkgver=1.2.1
pkgrel=1
license=(MIT)
pkgdesc="A simple Multimap based on Data.Map from the containers package."
url="http://hackage.haskell.org/package/${_hkgname}"
arch=('x86_64')
makedepends=("ghc")
depends=("haskell-containers")
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")

sha256sums=('6332c529475177b9e08d762d5701804dc2edc0ff26dd98a2a1dcd7ed092e7434')

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
