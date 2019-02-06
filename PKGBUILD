# Maintainer: Jaron Kent-Dobias <jaron@kent-dobias.com>

_hkgname=svg-builder
pkgname=haskell-svg-builder
pkgver=0.1.1
pkgrel=1
pkgdesc='Fast, easy to write SVG.'
url='https://hackage.haskell.org/package/svg-builder'
license=('BSD-3')
arch=('x86_64')
depends=('ghc-libs' 'haskell-blaze-builder' 'haskell-hashable' 'haskell-unordered-containers')
makedepends=('ghc')
source=(https://hackage.haskell.org/package/${_hkgname}-${pkgver}/${_hkgname}-${pkgver}.tar.gz
        haskell-svg-builder.patch)
sha512sums=('847f83c3b67b4a78b28fb66acfde50795d3dc3e691524d8dd27cb103989678721f04cd95dd7416a465784656f30e665b7c6165f783f1debc742b924a429c6ed9'
            '0eadca6c8a9eadfad8996c1993720d2a4d9ac51cab79c94876632184041713354c02a85c84ef5efce0eab3eaaf2ef9d59a379b9bdb7082e0eb56b6c0d2689130')

prepare() {
  cd ${_hkgname}-${pkgver}
  patch -Np1 -i "${srcdir}/haskell-svg-builder.patch"
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
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  ln -s /usr/share/doc/${pkgname}/html "${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}"
}

# vim: ts=2 sw=2 et:
