# Maintainer: William J. Bowman <bluephoenix47@gmail.com>
_hkgname=equivalence
pkgname=haskell-equivalence
pkgver=0.3.1
pkgrel=1
pkgdesc="Tarjan's union-find algorithm for equivalence relation."
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedepends=()
depends=('ghc' 'haskell-containers' 'haskell-mtl>=2.0.1'
'haskell-stmonadtrans' 'haskell-transformers>=0.2'
'haskell-transformers-compat>=0.3')
options=('strip' 'staticlibs')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
sha256sums=('7a0539546e4fc1a00fb190109be45b0cb4af7047d8c2abaf65b8e401e828207e')
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure -O \
      ${PKGBUILD_HASKELL_ENABLE_PROFILING:+-p } \
      --enable-split-objs \
      --enable-shared \
      --prefix=/usr \
      --docdir=/usr/share/doc/${pkgname} \
      --libsubdir=\$compiler/site-local/\$pkgid
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
