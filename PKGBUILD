# Maintainer: Jaron Kent-Dobias <jaron@kent-dobias.com>

_hkgname=dual-tree
pkgname=haskell-dual-tree
pkgver=0.2.2
pkgrel=1
pkgdesc='Rose trees with cached and accumulating monoidal annotations.'
url='https://hackage.haskell.org/package/dual-tree'
license=('BSD-3')
arch=('x86_64')
depends=('ghc-libs' 'haskell-monoid-extras' 'haskell-newtype-generics')
makedepends=('ghc')
source=(https://hackage.haskell.org/package/${_hkgname}-${pkgver}/${_hkgname}-${pkgver}.tar.gz
        haskell-dual-tree.patch)
sha512sums=('4f2415763eaa879c80d7682e9a0fa1b237e6fc9eea6b6751c3d0e0aae0031d45fbea82c715adaeb257449d42d20fb8223a42c0861f513300ed118820b42f90ca'
            'e62d0ad18b983d6359baca6a686e9fd002aa4b35e25de203bf5d7855b8c2dbc8d7fbcc4626a55d229754d7d40e00c075523edaf0485cd3bb8bd43abfa254c55d')

prepare() {
  cd ${_hkgname}-${pkgver}
  patch -Np1 -i "${srcdir}/haskell-dual-tree.patch"
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
  install -Dm 644 CHANGES -t "${pkgdir}/usr/share/doc/${pkgname}"
  ln -s /usr/share/doc/${pkgname}/html "${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}"
}

# vim: ts=2 sw=2 et:
