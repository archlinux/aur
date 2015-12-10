# Maintainer: Leif Warner <abimelech@gmail.com>
_hkgname=aeson-better-errors
pkgname=haskell-aeson-better-errors
pkgver=0.9.0
pkgrel=1
pkgdesc="Better error messages when decoding JSON values."
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:MIT')
arch=('i686' 'x86_64')
makedepends=()
depends=('ghc' 'haskell-aeson>=0.7' 'haskell-bytestring' 'haskell-dlist' 'haskell-mtl' 'haskell-scientific' 'haskell-text' 'haskell-transformers' 'haskell-transformers-compat>=0.3' 'haskell-unordered-containers' 'haskell-vector' 'haskell-void')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
md5sums=('f30b0d00786ba3c538d5758727f0c306')
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
