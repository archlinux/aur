# Maintainer: Jaron Kent-Dobias <jaron@kent-dobias.com>
# Contributor: Adria Arrufat <adria.arrufat@protonmail.ch>

_hkgname=hmatrix
pkgname=haskell-hmatrix
pkgver=0.19.0.0
pkgrel=2
pkgdesc="Linear systems, matrix decompositions, and other numerical computations based on BLAS and LAPACK."
url="https://hackage.haskell.org/package/hmatrix"
license=("BSD-3")
arch=('x86_64')
depends=('ghc-libs' 'haskell-random' 'haskell-split' 'haskell-storable-complex' 'haskell-vector' 'lapack' 'blas')
makedepends=('ghc')
source=(https://hackage.haskell.org/package/${_hkgname}-${pkgver}/${_hkgname}-${pkgver}.tar.gz
        haskell-hmatrix-semigroups.patch)
sha512sums=('14985ac8db51c45dec90c436d6de74e6b263ea0e219e23bf0930271874adaf9f317ae783a72a307e8a10a0b3da092ca78ca26f3b7e6433e0b9db4f224c6a3d0a'
            '9e47bc3950819c5f7807489208a7e46b9b5fc4f579c7df25ad2d06c35c082ceb31bc04355aeafb8814ba409abed9b395583c4769a894798901ed83ecd3c35007')

prepare() {
  cd ${_hkgname}-${pkgver}
  patch -Np1 -i "${srcdir}/haskell-hmatrix-semigroups.patch"
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
  install -Dm 644 CHANGELOG THANKS.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  ln -s /usr/share/doc/${pkgname}/html "${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}"
}

# vim: ts=2 sw=2 et:
