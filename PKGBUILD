# Maintainer: Jaron Kent-Dobias <jaron@kent-dobias.com>

_hkgname=diagrams-core
pkgname=haskell-diagrams-core
pkgver=1.4.1.1
pkgrel=1
pkgdesc="The core modules underlying diagrams, an embedded domain-specific language for compositional, declarative drawing."
url="https://hackage.haskell.org/package/diagrams-core"
license=("BSD-3")
arch=('x86_64')
depends=('ghc-libs' 'haskell-adjunctions' 'haskell-distributive' 'haskell-dual-tree' 'haskell-lens' 'haskell-linear' 'haskell-monoid-extras' 'haskell-profunctors' 'haskell-unordered-containers')
makedepends=('ghc')
source=(https://hackage.haskell.org/package/${_hkgname}-${pkgver}/${_hkgname}-${pkgver}.tar.gz
        haskell-diagrams-core-semigroups.patch)
sha512sums=('2f15d9151381e134eaa61e2f0e8551ab43c5171f166692c86e62482821736dc2069b0a4a45a96c6b6664b43868c3a9a46b87aa07aa1a9b0d44bed68aabc91547'
            'a5e00bd8a0105e7116efaa4d9153be7f20c4635b3526c902ffed14409a51c91c9678bc02ac707ecff7e553ba88f2a56d66e5f9a79d90a5ade944e91663fe40d7')

prepare() {
  cd ${_hkgname}-${pkgver}
  patch -Np1 -i "${srcdir}/haskell-diagrams-core-semigroups.patch"
}

build() {
  cd ${_hkgname}-${pkgver}
    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir=/usr/share/doc/$pkgname \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
  cd ${_hkgname}-${pkgver}
  install -Dm 744 register.sh "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
  install -Dm 744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
  install -dm 755 "${pkgdir}/usr/share/doc/ghc/html/libraries"
  runhaskell Setup copy --destdir="$pkgdir"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  ln -s /usr/share/doc/${pkgname}/html "${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}"
}

# vim: ts=2 sw=2 et:
