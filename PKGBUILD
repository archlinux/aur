# Maintainer: Jaron Kent-Dobias <jaron@kent-dobias.com>

_hkgname=operational
pkgname=haskell-operational
pkgver=0.2.3.5
pkgrel=2
pkgdesc='This library makes it easy to implement monads with tricky control flow.'
url='https://hackage.haskell.org/package/operational'
license=('BSD-3')
arch=('x86_64')
depends=('ghc-libs' 'haskell-random')
makedepends=('ghc')
source=(https://hackage.haskell.org/package/${_hkgname}-${pkgver}/${_hkgname}-${pkgver}.tar.gz)
sha512sums=('80ddcadc3aaa1b37514d31441f81b7d5e89263921f26ba2d877327a8eeb95da99f858ea54f2e72b6413f08a8e85b3fa54bac9d3327e5a63945ad90a25be51ed4')

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
