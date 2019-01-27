# Maintainer: Jaron Kent-Dobias <jaron@kent-dobias.com>

_hkgname=gnuplot
pkgname=haskell-gnuplot
pkgver=0.5.5.3
pkgrel=2
pkgdesc='A wrapper to gnuplot which lets you create 2D and 3D plots.'
url='https://hackage.haskell.org/package/gnuplot'
license=('BSD-3')
arch=('x86_64')
depends=('ghc-libs' 'haskell-data-accessor' 'haskell-data-accessor-transformers' 'haskell-temporary' 'haskell-utility-ht' 'gnuplot')
makedepends=('ghc')
source=(https://hackage.haskell.org/package/${_hkgname}-${pkgver}/${_hkgname}-${pkgver}.tar.gz
        haskell-gnuplot-semigroups.patch)
sha512sums=('566d0607233a16557201e2ea859c7105ad91007806cf2184a6ee55d517c84681f3fe7623c3497d682232d5b184855bf1f8a838222c4e2abade674b714c7a11de'
            'd991d517f583b4c7d7952aa8b9a29de9153de5da92b90286773aef2845feac5a56402ee16e4dc741f09e701eae8df9c3edd9a77a0447d811069940052adefe24')

prepare() {
  cd ${_hkgname}-${pkgver}
  patch -Np1 -i "${srcdir}/haskell-gnuplot-semigroups.patch"
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
  install -Dm 644 Changes.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  ln -s /usr/share/doc/${pkgname}/html "${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}"
}

# vim: ts=2 sw=2 et:
