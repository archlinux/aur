# Maintainer: Jaron Kent-Dobias <jaron@kent-dobias.com>

_hkgname=diagrams-solve
pkgname=haskell-diagrams-solve
pkgver=0.1.1
pkgrel=1
pkgdesc='Pure Haskell solver routines used by the diagrams project.'
url='https://hackage.haskell.org/package/diagrams-solve'
license=('BSD-3')
arch=('x86_64')
depends=('ghc-libs')
makedepends=('ghc')
source=(https://hackage.haskell.org/package/${_hkgname}-${pkgver}/${_hkgname}-${pkgver}.tar.gz
        haskell-diagrams-solve.patch)
sha512sums=('00045731820dbc1c2c0226dbfcc5781afc9f464cb4c0ac9a8a8ed01e533720c8cdc783c41c92e146b722ab4b7954af7cc7d012ee3598b4a8833a112f1319030c'
            'f5e867e50f131c501bbd94808fcfe329b36459f69e649320056c45ff49d0d77cdd3e4c8aae7c76f2118b70d89bad869235ba8ab96d24422f2d9d8b16ce92a9d1')

prepare() {
  cd ${_hkgname}-${pkgver}
  patch -Np1 -i "${srcdir}/haskell-diagrams-solve.patch"
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
  install -Dm 644 CHANGES.markdown README.markdown -t "${pkgdir}/usr/share/doc/${pkgname}"
  ln -s /usr/share/doc/${pkgname}/html "${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}"
}

# vim: ts=2 sw=2 et:
