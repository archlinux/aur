# Maintainer: Jaron Kent-Dobias <jaron@kent-dobias.com>

_hkgname=mersenne-random-pure64
pkgname=haskell-mersenne-random-pure64
pkgver=0.2.2.0
pkgrel=1
pkgdesc='A purely functional binding to the 64 bit classic mersenne twister.'
url='https://hackage.haskell.org/package/mersenne-random-pure64'
license=('BSD-3')
arch=('x86_64')
depends=('ghc-libs' 'haskell-random')
makedepends=('ghc')
source=(https://hackage.haskell.org/package/${_hkgname}-${pkgver}/${_hkgname}-${pkgver}.tar.gz)
sha512sums=('4329491b2f86dc256f24111ac7ae6ee527113e4fc32ecb3fb81563ca175296cf6fb3844147740845a9d7e6d09f48e2be338bd8e56468075b36c1f00d7c47e331')

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
