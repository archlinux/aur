# Maintainer: Jaron Kent-Dobias <jaron@kent-dobias.com>

_hkgname=diagrams-svg
pkgname=haskell-diagrams-svg
pkgver=1.4.2
pkgrel=1
pkgdesc="A modular backend for rendering diagrams created with the diagrams EDSL to SVG files."
url="https://hackage.haskell.org/package/diagrams-diagrams-svg"
license=("BSD-3")
arch=('x86_64')
depends=('ghc-libs' 'haskell-base64-bytestring' 'haskell-colour' 'haskell-containers' 'haskell-diagrams-core' 'haskell-diagrams-lib' 'haskell-hashable' 'haskell-juicypixels' 'haskell-lens' 'haskell-monoid-extras' 'haskell-optparse-applicative' 'haskell-split' 'haskell-svg-builder')
makedepends=('ghc')
source=(https://hackage.haskell.org/package/${_hkgname}-${pkgver}/${_hkgname}-${pkgver}.tar.gz
        haskell-diagrams-svg-semigroups.patch)
sha512sums=('dfbdeffa6ac882b5541efc9ce19956f9b4a96e95c2b7006f7370cd0a93a367d98b41abe9474405df828ce44a1b063d142220ec5ca30ff3e632e572b14f3c223f'
            '59e8859b354d35456b8af43ee0dfa62572d98257e76726f2cd0bd585793c3e7b77e4b8509d3491453f87472f9266586d58e59ac9105bcce46695eb1ef8df823d')

prepare() {
  cd ${_hkgname}-${pkgver}
  patch -Np1 -i "${srcdir}/haskell-diagrams-svg-semigroups.patch"
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
  install -Dm 644 CHANGELOG.md README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  ln -s /usr/share/doc/${pkgname}/html "${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}"
}

# vim: ts=2 sw=2 et:
