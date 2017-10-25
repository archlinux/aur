# $Id$
# Maintainer: Damir Jelić <poljar@termina.org.uk>

_hkgname=wreq
pkgname=haskell-wreq
pkgver=0.5.1.0
pkgrel=1
pkgdesc="An easy-to-use HTTP client library. "
url="http://www.serpentine.com/wreq"
license=("BSD3")
arch=('i686' 'x86_64')
depends=('haskell-aeson' 'haskell-attoparsec' 'haskell-authenticate-oauth'
         'haskell-base' 'haskell-base16-bytestring' 'haskell-byteable' 'haskell-bytestring'
         'haskell-case-insensitive' 'haskell-containers' 'haskell-cryptohash'
         'haskell-exceptions' 'haskell-ghc-prim' 'haskell-hashable' 'haskell-http-client'
         'haskell-http-client-tls' 'haskell-lens' 'haskell-lens-aeson'
         'haskell-mime-types' 'haskell-psqueues' 'haskell-template-haskell' 
         'haskell-http-types' 'haskell-text' 'haskell-time'
         'haskell-time-locale-compat' 'haskell-unordered-containers')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-${pkgver}.tar.gz")
sha512sums=('c29a1d3ebc841cd012f8bb226f33ab72a6e27fd18a97ffa466862f7c96a0362df5f47aceba013985f294ad4ccfb896e50d1ead28226c927cab1e925951a8a343')

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
    install -D -m644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
