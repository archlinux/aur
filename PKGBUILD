# Maintainer: Jaron Kent-Dobias <jaron@kent-dobias.com>

_hkgname=diagrams-postscript
pkgname=haskell-diagrams-postscript
pkgver=1.4.1
pkgrel=1
pkgdesc="A modular backend for rendering diagrams created with the diagrams EDSL using Postscript."
url="https://hackage.haskell.org/package/diagrams-diagrams-postscript"
license=("BSD-3")
arch=('x86_64')
depends=('ghc-libs' 'haskell-containers' 'haskell-data-default-class' 'haskell-diagrams-core' 'haskell-diagrams-lib' 'haskell-dlist' 'haskell-hashable' 'haskell-lens' 'haskell-monoid-extras' 'haskell-split' 'haskell-statestack')
makedepends=('ghc')
source=(https://hackage.haskell.org/package/${_hkgname}-${pkgver}/${_hkgname}-${pkgver}.tar.gz
        haskell-diagrams-postscript.patch)
sha512sums=('4e9b1e270c60bdd4ae607320f967be636a1dcd5e8df14983f3194fa2c011989ac0a63436b2a3cfb6775d24096991c577e40f42b0b6a954a6d00d6eeb5f86578f'
            'aeb9c9624ebce879d3ec6fe1297233e48776ebe36dbafe2b14e61fa1025cdc7b8e9b37bb035f9f51f60ec0835585f7b3af078bc2174999fd56a114c0e4306718')

prepare() {
  cd ${_hkgname}-${pkgver}
  patch -Np1 -i "${srcdir}/haskell-diagrams-postscript.patch"
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
  ln -s /usr/share/doc/${pkgname}/html "${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}"
}

# vim: ts=2 sw=2 et:
