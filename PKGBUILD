# $Id$
# Maintainer: Emanuel Couto <unit73e@gmail at gmail dot com>
# Contributor: André van Delden <andre.van.delden at uni-bremen dot de>

_hkgname=bytes
pkgname=haskell-bytes
pkgver=0.15.3
pkgrel=1
pkgdesc="Sharing code for serialization between binary and cereal "
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
depends=('ghc-libs'
         'haskell-base>=4.5' 'haskell-base<5'
         'haskell-binary>=0.5.1' 'haskell-binary<0.9'
         'haskell-bytestring>=0.9' 'haskell-bytestring<0.11'
         'haskell-cereal>=0.3.5' 'haskell-cereal<0.6'
         'haskell-containers>=0.3' 'haskell-containers<1'
         'haskell-ghc-prim'
         'haskell-hashable>=1.0.1.1' 'haskell-hashable<1.4'
         'haskell-mtl>=2.0' 'haskell-mtl<2.3'
         'haskell-scientific>=0.0' 'haskell-scientific<1'
         'haskell-text>=0.2' 'haskell-text<1.3'
         'haskell-time>=1.2' 'haskell-time<1.9'
         'haskell-transformers>=0.2' 'haskell-transformers<0.6'
         'haskell-transformers-compat>=0.3' 'haskell-transformers-compat<1'
	 'haskell-unordered-containers>=0.2' 'haskell-unordered-containers<0.3'
         'haskell-void>=0.6' 'haskell-void<1')
makedepends=('ghc')
source=('bytes::git+https://github.com/ekmett/bytes.git#commit=90fa9d874044e4ff36cfe4df71ee0dfc00ab742f')
md5sums=('SKIP')

build() {
    cd "${srcdir}/${_hkgname}"
    
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
    cd "${srcdir}/${_hkgname}"
    
    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
    install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
