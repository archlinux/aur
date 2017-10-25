# $Id$
# Maintainer: Damir Jelić <poljar@termina.org.uk>

_hkgname=authenticate-oauth
pkgname=haskell-authenticate-oauth
pkgver=1.6
pkgrel=1
pkgdesc="Library to authenticate with OAuth for Haskell web applications."
url="http://github.com/yesodweb/authenticate"
license=("BSD3")
arch=('i686' 'x86_64')
depends=('haskell-base' 'haskell-base64-bytestring' 'haskell-bytestring' 'haskell-blaze-builder'
         'haskell-crypto-pubkey-types' 'haskell-data-default' 'haskell-http-client'
         'haskell-http-types' 'haskell-random' 'haskell-rsa' 'haskell-sha'
         'haskell-time' 'haskell-transformers' 'haskell-transformers-compat')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-${pkgver}.tar.gz"
        'oauth.patch')
sha512sums=('1cd4db3874b05a8856dcd07ee1e63fdafb92e8997b9caf81436d882f36c1bda3fce4b32cdbfa28ffa5f5374566ffa981537f527d8814131e7d61f2d1b8999931'
            'a02dc495235f973582b325394d9a1f7f0ad1e64b99fb87d35ab0d8755a11fcc8149bf4b0bf36acdb78bff753bbd07aa9e2a62cecdd0dad69ac3b83fa5de61ffb')

prepare() {
    echo $(pwd)
    patch -Np1 -i "${srcdir}/oauth.patch"
}

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
