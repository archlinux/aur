# Maintainer: Jaron Kent-Dobias <jaron@kent-dobias.com>

_hkgname=statestack
pkgname=haskell-statestack
pkgver=0.2.0.5
pkgrel=1
pkgdesc="Simple State-like monad transformer where states can be saved to and restored from an internal stack."
url="https://hackage.haskell.org/package/statestack"
license=("BSD-3")
arch=('x86_64')
depends=('ghc-libs' 'haskell-transformers-compat')
makedepends=('ghc')
source=(https://hackage.haskell.org/package/${_hkgname}-${pkgver}/${_hkgname}-${pkgver}.tar.gz
        haskell-statestack.patch)
sha512sums=('077df22b86e415d773cafd0f21b38ae174b9b7861e5ad08626820d1836b290ddb55822e5389cedcddeef2d723ce17b49849d8c2bb6fd201e73f603ffb9eed262'
            '241df7bab8b5a056400377745c7fda9b337f16b48e0a426aca84870967bc507361ab2de31c0fecb13da7af9f217d75a389d9046ae8591e8522056a2555bb7d57')

prepare() {
  cd ${_hkgname}-${pkgver}
  patch -Np1 -i "${srcdir}/haskell-statestack.patch"
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
  install -Dm 644 CHANGES.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  ln -s /usr/share/doc/${pkgname}/html "${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}"
}

# vim: ts=2 sw=2 et:
