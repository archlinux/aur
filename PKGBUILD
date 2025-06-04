# Maintainer: MajorX234 <MajorX234 at gmail dot com>
# Contributor: Emanuel Couto <unit73e at gmail dot com>
# Contributor: Daniel Nagy <danielnagy at gmx de>

_hkgname=GLURaw
pkgname=haskell-gluraw
pkgver=2.0.0.5
pkgrel=2
pkgdesc="A raw binding for the OpenGL graphics system"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
depends=('ghc-libs' 'haskell-openglraw>=3.0.0.0' 'libgl' 'glu')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('518cb837e6680c0c91297fa291e2bf3c47c94420bc26dba5c337888b87ec0f8e2bde9fe0740cc870062a4f02fe4e0093df55ed0de54371839233e89af6d97a56')

build() {
    cd "${srcdir}/${_hkgname}-${pkgver}"

    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir="/usr/share/doc/${pkgname}" \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
} 

package() {
    cd ${srcdir}/${_hkgname}-${pkgver}

    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
    install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
