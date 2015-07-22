# Contributor: Leif Warner <abimelech@gmail.com>
# Maintainer: Colin Woodbury <colingw@gmail.com>
_hkgname=lens
pkgname=haskell-lens
pkgver=4.12.1
pkgrel=1
pkgdesc="Lenses, Folds and Traversals"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedepends=()
depends=('ghc'
  'haskell-array<0.6'
  'haskell-bifunctors<6'
  'haskell-bytestring'
  'haskell-comonad<5'
  'haskell-containers'
  'haskell-contravariant<2'
  'haskell-distributive<1'
  'haskell-exceptions<1'
  'haskell-filepath'
  'haskell-free<5'
  'haskell-hashable<1.3'
  'haskell-kan-extensions'
  'haskell-mtl<2.3'
  'haskell-parallel<3.3'
  'haskell-profunctors<6'
  'haskell-reflection<3'
  'haskell-semigroupoids<6'
  'haskell-semigroups<1'
  'haskell-tagged<1'
  'haskell-template-haskell<2.11'
  'haskell-text<1.3'
  'haskell-transformers-compat<1'
  'haskell-transformers<0.5'
  'haskell-unordered-containers<0.3'
  'haskell-vector<0.12'
  'haskell-void<1')
options=('strip' 'staticlibs')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
md5sums=('85bc0fdc1f8a26f4aed9dcd9c2b76e75')
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
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
