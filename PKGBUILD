# Maintainer: Jaron Kent-Dobias <jaron@kent-dobias.com>

_hkgname=monoid-extras
pkgname=haskell-monoid-extras
pkgver=0.5
pkgrel=1
pkgdesc='Various extra monoid-related definitions and utilities.'
url='https://hackage.haskell.org/package/monoid-extras'
license=('BSD-3')
arch=('x86_64')
depends=('ghc-libs' 'haskell-groups' 'haskell-semigroupoids')
makedepends=('ghc')
source=(https://hackage.haskell.org/package/${_hkgname}-${pkgver}/${_hkgname}-${pkgver}.tar.gz
        haskell-monoid-extras.patch)
sha512sums=('3e30d3dbddb58ad8093a7ad8d42a662303668006f15bec648ca2d78fcf1637696e889a26109d6652fe27de0e732f86be6b0a29d6df262e305b63915312032ba4'
            '6ea2664836f0f669dbd06d3856d61316adf8e4f83d289574a7ffb3150c022a6e9c098c94f120ce6af5c7e1ed491f622fca114acd8a5dfdf5be089a64a8860e62')

prepare() {
  cd ${_hkgname}-${pkgver}
  patch -Np1 -i "${srcdir}/haskell-monoid-extras.patch"
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
