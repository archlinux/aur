# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Lex Black <autumn-wind at web dot de>

pkgname=haskell-lifted-base
_hkgname=lifted-base
_licensefile=LICENSE
pkgver=0.2.3.6
pkgrel=2
pkgdesc="lifted-base exports IO operations from the base library lifted to any instance of MonadBase or MonadBaseControl."
url="http://hackage.haskell.org/package/lifted-base"
license=('BSD3')
arch=('i686' 'x86_64')
depends=( 'ghc' 'haskell-base-unicode-symbols' 'haskell-monad-control' 'haskell-transformers-base')
options=('strip' 'staticlibs' )
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=('57c5837d83f569bb72136ca89256e50e1ac168ee935804a8e7763e9d8322e1fb')

build() {
    cd ${srcdir}/${_hkgname}-${pkgver}

    runhaskell Setup configure -O ${PKGBUILD_HASKELL_ENABLE_PROFILING:+-p } --enable-split-objs --enable-shared \
        --prefix=/usr --docdir=/usr/share/doc/${pkgname} \
        --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    install -D -m744 register.sh   ${pkgdir}/usr/share/haskell/${pkgname}/register.sh
    install    -m744 unregister.sh ${pkgdir}/usr/share/haskell/${pkgname}/unregister.sh
    install -d -m755 ${pkgdir}/usr/share/doc/ghc/html/libraries
    ln -s /usr/share/doc/${pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}
    runhaskell Setup copy --destdir=${pkgdir}
    install -D -m644 ${_licensefile} ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/${_licensefile}
}
