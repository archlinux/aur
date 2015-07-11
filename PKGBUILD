# Maintainer: André van Delden <andre.van.delden@uni-bremen.de>

_hkgname=linear
pkgname=haskell-linear
pkgver=1.19.1.2
pkgrel=1
pkgdesc="Linear Algebra"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('BSD3')
arch=('any')
makedepends=()
depends=('ghc'
         'haskell-adjunctions>=4.0' 'haskell-adjunctions<5'
         'haskell-base>=4.5' 'haskell-base<5'
         'haskell-binary>=0.5' 'haskell-binary<0.8'
         'haskell-bytes>=0.15' 'haskell-bytes<1'
         'haskell-cereal>=0.4.1.1' 'haskell-cereal<0.5'
         'haskell-containers>=0.4' 'haskell-containers<0.6'
         'haskell-deepseq>=1.1' 'haskell-deepseq<1.5'
         'haskell-distributive>=0.2.2' 'haskell-distributive<1'
         'haskell-ghc-prim'
         'haskell-hashable>=1.1' 'haskell-hashable<1.3'
         'haskell-lens>=4.0' 'haskell-lens<5'
         'haskell-reflection>=1.3.2' 'haskell-reflection<3'
         'haskell-semigroupoids>=3.0' 'haskell-semigroupoids<6'
         'haskell-semigroups>=0.9' 'haskell-semigroups<1'
         'haskell-tagged>=0.4.4' 'haskell-tagged<1'
         'haskell-template-haskell>=2.7' 'haskell-template-haskell<3.0'
         'haskell-transformers>=0.2' 'haskell-transformers<0.5'
         'haskell-transformers-compat>=0.4' 'haskell-transformers-compat<1'
         'haskell-unordered-containers>=0.2.3' 'haskell-unordered-containers<0.3'
         'haskell-vector>=0.10.0' 'haskell-vector<0.11'
         'haskell-void>=0.6' 'haskell-void<1')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
sha512sums=('e6c180ccaad8a4e8d55516e0bb535792cdac2744fa46fde00dace6f51c4d4045ae620b8c6c7e9dafc4e26ce727073858a8d75e47684d7beb48ce930cdc17068b')
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
