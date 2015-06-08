# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Nicola Squartini <tensor5@gmail.com>

_hkgname=filestore
pkgname=haskell-filestore
pkgver=0.6.0.4
pkgrel=1
pkgdesc="Interface for versioning file stores."
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedepends=()
depends=('ghc' 'haskell-bytestring>=0.9' 'haskell-containers>=0.3' 'haskell-diff>=0.2'
         'haskell-directory>=1.1' 'haskell-filepath>=1.1'
         'haskell-old-locale>=1.0' 'haskell-parsec>=2' 'haskell-process>=1.0'
         'haskell-split>=0.1' 'haskell-time>=1.1' 'haskell-time<1.5'
         'haskell-utf8-string>=0.3' 'haskell-xml>=1.3')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
md5sums=('6a3c642305ababb722efd51088ceb91b')
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
