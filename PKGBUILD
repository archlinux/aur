# Maintainer: Jaron Kent-Dobias <jaron@kent-dobias.com>

_hkgname=diagrams-lib
pkgname=haskell-diagrams-lib
pkgver=1.4.2.3
pkgrel=1
pkgdesc="A standard library of primitives and operations for creating diagrams."
url="https://hackage.haskell.org/package/diagrams-lib"
license=("BSD-3")
arch=('x86_64')
depends=('ghc-libs' 'haskell-active' 'haskell-adjunctions' 'haskell-cereal' 'haskell-colour' 'haskell-data-default-class' 'haskell-diagrams-core' 'haskell-diagrams-solve' 'haskell-distributive' 'haskell-dual-tree' 'haskell-exceptions' 'haskell-fingertree' 'haskell-fsnotify' 'haskell-hashable' 'haskell-intervals' 'haskell-juicypixels' 'haskell-lens' 'haskell-linear' 'haskell-monoid-extras' 'haskell-optparse-applicative' 'haskell-profunctors' 'haskell-tagged' 'haskell-unordered-containers')
makedepends=('ghc')
source=(https://hackage.haskell.org/package/${_hkgname}-${pkgver}/${_hkgname}-${pkgver}.tar.gz
        haskell-diagrams-lib.patch)
sha512sums=('fc50dfe46b37bb0ee447a9c27fc7c23ef917e8a5249407c30d37c9f9c65fe452c9c0442e252a7a71fb496e9d9172489559d26bfe49536a697aef7b21f362965f'
            '63793e54594034e9177a4d13655ad4578a890b23915e95600b01c5add06f6db592554cdae3578c309bb05c35b7264ec9f5afa36ec6a7ca87e673c87f3c373502')

prepare() {
  cd ${_hkgname}-${pkgver}
  patch -Np1 -i "${srcdir}/haskell-diagrams-lib.patch"
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
  install -Dm 644 CHANGELOG.md README.markdown -t "${pkgdir}/usr/share/doc/${pkgname}"
  ln -s /usr/share/doc/${pkgname}/html "${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}"
}

# vim: ts=2 sw=2 et:
