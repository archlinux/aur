# Maintainer: Jaron Kent-Dobias <jaron@kent-dobias.com>

_hkgname=Chart-cairo
pkgname=haskell-chart-cairo
pkgver=1.9
pkgrel=1
pkgdesc='Cairo backend for Charts.'
url='https://hackage.haskell.org/package/Chart-cairo'
license=('BSD-3')
arch=('x86_64')
depends=('ghc-libs' 'haskell-cairo' 'haskell-chart' 'haskell-colour' 'haskell-data-default-class' 'haskell-lens' 'haskell-old-locale' 'haskell-operational')
makedepends=('ghc')
source=(https://hackage.haskell.org/package/${_hkgname}-${pkgver}/${_hkgname}-${pkgver}.tar.gz
        haskell-chart-cairo-lens.patch)
sha512sums=('73f38490ffb6b29145c22f0cc3f0c648b75e27a5b212f9f05b099de8859b5e7c21100e7a99e0d2314d272398010d1bd5e2773b834a9e2f400eccc999ac07a486'
            'a23c5a8391d5171d710cbcc937407b3c0cf063381b9c6ee881da96a61d29a534f755d4cbcf453583acb3e481d8e0c11219524bbec133043b0f0ab0d15a21591a')

prepare() {
  cd ${_hkgname}-${pkgver}
  patch -Np1 -i "${srcdir}/haskell-chart-cairo-lens.patch"
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
