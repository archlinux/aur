# Maintainer: André van Delden <andre.van.delden@uni-bremen.de>

_hkgname=linear
pkgname=haskell-linear
pkgver=1.17.1
pkgrel=1
pkgdesc="Linear Algebra"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedepends=()
depends=('ghc' 'haskell-adjunctions<5' 'haskell-binary<0.8' 'haskell-bytes<1' 'haskell-cereal<0.5' 'haskell-containers=0.4.0.0' 'haskell-deepseq=1.1.0.2' 'haskell-distributive<1' 'haskell-hashable<1.3' 'haskell-lens<5' 'haskell-reflection<2' 'haskell-semigroupoids<5' 'haskell-semigroups<1' 'haskell-tagged<1' 'haskell-template-haskell' 'haskell-transformers=0.2.2.0' 'haskell-transformers-compat<1' 'haskell-unordered-containers<0.3' 'haskell-vector<0.11' 'haskell-void<1')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
sha512sums=('b60dd3d259a7cdbdb912c790a1d6af0ed287feb8bce99dfdd12810667ba47abb80dc4d0d4d0db8a57a334812fc814521016a23734421178b7e1d5dddf090b4b3')
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
