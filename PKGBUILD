# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Daniel Nagy <danielnagy at gmx de>

_hkgname=HaXml
pkgname=haskell-haxml
pkgver=1.25.5
pkgrel=1
pkgdesc="Utilities for manipulating XML documents"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('LGPL')
arch=('i686' 'x86_64')
makedepends=()
provides=('FpMLToHaskell' 'XsdToHaskell' 'DtdToHaskell' 'MkOneOf' 'Validate' 'Xtract' 'CanonicaliseLazy' 'Canonicalise')
depends=('ghc' 'haskell-random' 'haskell-polyparse>=1.10' 'haskell-pretty' 'haskell-pretty' 'haskell-filepath')
options=('strip')
source=(https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
sha256sums=('cbc51ac4b6128e130f0272a7b42ab464bc865b3c238d6cce6b76e451765c1235')

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
