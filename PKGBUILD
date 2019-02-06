# Maintainer: Jaron Kent-Dobias <jaron@kent-dobias.com>
# Contributor: Daniel Nagy <danielnagy at gmx de>

_hkgname=Chart
pkgname=haskell-chart
pkgver=1.9
pkgrel=2
pkgdesc="A library for generating 2D Charts and Plots."
url="https://hackage.haskell.org/package/${_hkgname}"
license=('BSD-3')
arch=('x86_64')
depends=('ghc-libs' 'haskell-data-default-class'  'haskell-colour'
         'haskell-lens' 'haskell-old-locale' 'haskell-operational' 'haskell-vector')
makedepends=('ghc')
source=(https://hackage.haskell.org/package/${_hkgname}-${pkgver}/${_hkgname}-${pkgver}.tar.gz
        00094db4f071c2fef8b853ab7b5d04e6e0f4b6fe.patch
        haskell-chart-lens.patch)
sha512sums=('ccc78479384792bee5dec369743bcc909416dcc3d7d5d304b81e251c70497c2084e4c36fcf3d70a5c0204c95efc840edbc171dffe8bd98dd4e54176c78e86976'
            '4bd45567d228d35790d2c9e8db67d588c63e05758e3954552bc31e74fc564f2d35ea35265e60605355c7d5370a47d3e0db965ca5fa2a0669d2f936df93d46353'
            '9345a8da752a1cfef87dea5620743cd680f8084762db88b48b6fb2fcb74c1b0e64db73d0a3ef677c8174223acfeed20eb6472351e30f133f0f1ecaa1d3da09ee')

prepare() {
  cd ${_hkgname}-${pkgver}
  patch -Np1 -i "${srcdir}/haskell-chart-lens.patch"
  patch -Np2 -i "${srcdir}/00094db4f071c2fef8b853ab7b5d04e6e0f4b6fe.patch"
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
