# Maintainer: André van Delden <andre.van.delden@uni-bremen.de>

_hkgname=bytes
pkgname=haskell-bytes
pkgver=0.15
pkgrel=1
pkgdesc="Sharing code for serialization between binary and cereal "
url="http://hackage.haskell.org/package/${_hkgname}"
license=('BSD3')
arch=('any')
makedepends=()
depends=('ghc'
         'haskell-base>=4.5' 'haskell-base<5'
         'haskell-binary>=0.5.1' 'haskell-binary<0.8'
         'haskell-bytestring>=0.9' 'haskell-bytestring<0.11'
         'haskell-cereal>=0.3.5' 'haskell-cereal<0.5'
         'haskell-containers>=0.3' 'haskell-containers<1'
         'haskell-ghc-prim'
         'haskell-mtl>=2.0' 'haskell-mtl<2.3'
         'haskell-text>=0.2' 'haskell-text<1.3'
         'haskell-time>=1.2' 'haskell-time<1.6'
         'haskell-transformers>=0.2' 'haskell-transformers<0.5'
         'haskell-transformers-compat>=0.3' 'haskell-transformers-compat<1'
         'haskell-void>=0.6' 'haskell-void<1')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
sha512sums=('8f53855392a2a682d1a28b6ba42b7d701303a150832a5e51c2ed541b2fb8ec3555f47201e717a1a9d781b176a0608e802e67207e77a4125a84ae0338f0148d0d')
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure -O ${PKGBUILD_HASKELL_ENABLE_PROFILING:+-p } --enable-split-objs --enable-shared \
       --prefix=/usr --docdir=/usr/share/doc/${pkgname} --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock
    runhaskell Setup register   --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}
package() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    install -D -m744 register.sh   ${pkgdir}/usr/share/haskell/${pkgname}/register.sh
    install    -m744 unregister.sh ${pkgdir}/usr/share/haskell/${pkgname}/unregister.sh
    install -d -m755 ${pkgdir}/usr/share/doc/ghc/html/libraries
    ln -s /usr/share/doc/${pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}
    runhaskell Setup copy --destdir=${pkgdir}
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
