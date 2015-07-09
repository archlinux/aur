# Maintainer: Colin Woodbury <colingw@gmail.com>
# Maintainer: Leif Warner <abimelech@gmail.com>
# Contributor: Cedric Girard <girard.cedric@gmail.com>
# Contributor: Arch Haskell Team <arch-haskell@haskell.org>
_hkgname=libmpd
pkgname=haskell-libmpd
pkgver=0.9.0.2
pkgrel=1
pkgdesc="An MPD client library."
url="http://hackage.haskell.org/package/${_hkgname}"
license=('LGPL')
arch=('i686' 'x86_64')
makedepends=()
depends=('ghc'
  'haskell-attoparsec<1'
  'haskell-bytestring<1'
  'haskell-containers'
  'haskell-data-default>=0.4'
  'haskell-filepath'
  'haskell-mtl<3'
  'haskell-network<3'
  'haskell-text>=0.11'
  'haskell-time<2'
  'haskell-utf8-string'
)
options=('staticlibs')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
md5sums=('f02b903117e8284b30826b07ee8e0b52')
install=${pkgname}.install
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
}
