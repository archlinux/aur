# $Id$
# Maintainer: Damir Jelić <poljar@termina.org.uk>

_hkgname=RSA
pkgname=haskell-rsa
pkgver=2.3.0
pkgrel=1
pkgdesc="Implementation of RSA, using the padding schemes of PKCS#1 v2.1."
url="https://github.com/GaloisInc/RSA"
license=("BSD3")
arch=('i686' 'x86_64')
depends=('haskell-base' 'haskell-binary' 'haskell-bytestring' 'haskell-crypto-api'
         'haskell-crypto-pubkey-types' 'haskell-sha')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-${pkgver}.tar.gz")
sha512sums=('134e86897ce345de00c660e3a34fb2395bbd82419a7e708b5741ba38113e46092db6c236c55e3e57b4e2c777eaf22850f3e95fc46d2cf70c50c4383519a8319e')

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
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
    install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
