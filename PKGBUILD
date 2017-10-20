# $Id$
# Maintainer: Emanuel Couto <unit73e at gmail dot com>
# Contributor: André van Delden <andre.van.delden at uni-bremen dot de>

_hkgname=linear
pkgname=haskell-linear
pkgver=1.20.7
pkgrel=1
pkgdesc="Linear Algebra"
url="http://github.com/ekmett/linear"
license=('custom:BSD3')
arch=('i686' 'x86_64')
depends=('ghc-libs'
         'haskell-adjunctions>=4.0' 'haskell-adjunctions<5'
         'haskell-base>=4.5' 'haskell-base<5'
         'haskell-base-orphans>=0.5' 'haskell-base-orphans<1'
         'haskell-binary>=0.5' 'haskell-binary<0.9'
         'haskell-bytes>=0.15' 'haskell-bytes<1'
         'haskell-cereal>=0.4.1.1' 'haskell-cereal<0.6'
         'haskell-containers>=0.4' 'haskell-containers<0.6'
         'haskell-deepseq>=1.1' 'haskell-deepseq<1.5'
         'haskell-distributive>=0.2.2' 'haskell-distributive<1'
         'haskell-ghc-prim'
         'haskell-hashable>=1.1' 'haskell-hashable<1.3'
         'haskell-lens>=4.0' 'haskell-lens<5'
         'haskell-reflection>=1.3.2' 'haskell-reflection<3'
         'haskell-semigroupoids>=5.2.1' 'haskell-semigroupoids<5.3'
         'haskell-semigroups>=0.9' 'haskell-semigroups<1'
         'haskell-tagged>=0.4.4' 'haskell-tagged<1'
         'haskell-template-haskell>=2.7' 'haskell-template-haskell<3.0'
         'haskell-transformers>=0.2' 'haskell-transformers<0.6'
         'haskell-transformers-compat>=0.4' 'haskell-transformers-compat<1'
         'haskell-unordered-containers>=0.2.3' 'haskell-unordered-containers<0.3'
         'haskell-vector>=0.10.0' 'haskell-vector<0.13'
         'haskell-void>=0.6' 'haskell-void<1')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('d60e2f5bb3bee1ad71e7756090b91a1268b5f40065300f511bf190629aaa1c6cfc424feb576641517a5ff63d4afaa655bc01326eacf4b304220911486ff9745c')

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
