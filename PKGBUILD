# Maintainer: Jaron Kent-Dobias <jaron@kent-dobias.com>

_hkgname=active
pkgname=haskell-active
pkgver=0.2.0.13
pkgrel=1
pkgdesc="Abstraction for animated things with finite start and end times."
url="https://hackage.haskell.org/package/active"
license=("BSD-3")
arch=('x86_64')
depends=('ghc-libs' 'haskell-lens' 'haskell-linear' 'haskell-semigroupoids' 'haskell-vector')
makedepends=('ghc')
source=(https://hackage.haskell.org/package/${_hkgname}-${pkgver}/${_hkgname}-${pkgver}.tar.gz
        haskell-active-semigroups.patch)
sha512sums=('862471ad80bf36feb0df8747d7ed964a80d20ca994eac18708b2ced31af44cd6c450d621cfe92b426ace3c3583a7e1d835c357f47885ee800fdbab19a35f239d'
            '66161fef9e1e881507d7f06def9cfadfcc2445cefca2b190d051dd6ec01c6f888fe3cef24eb419bdc22d95b38b396e2eaf87646541dfa03925821acf3657d840')

prepare() {
  cd ${_hkgname}-${pkgver}
  patch -Np1 -i "${srcdir}/haskell-active-semigroups.patch"
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
  install -Dm 644 CHANGES README.markdown -t "${pkgdir}/usr/share/doc/${pkgname}"
  ln -s /usr/share/doc/${pkgname}/html "${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}"
}

# vim: ts=2 sw=2 et:
