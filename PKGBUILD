# Maintainer: André van Delden <andre.van.deldenX@Xuni-bremen.de>

_hkgname=vinyl
pkgname=haskell-vinyl
pkgver=0.5.1
pkgrel=1

pkgdesc="Extensible records for Haskell with lenses using modern GHC features."

url="http://hackage.haskell.org/package/${_hkgname}"
license=('MIT')
arch=('any')
depends=('ghc' 'haskell-base>=4.7' 'haskell-base<5' 'haskell-ghc-prim')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install="${pkgname}.install"
sha512sums=('2bfb61372f92ffec85769f8525323fd076347a6fd45f28c85840f03e433dedf7dc77c77e4b3d915ae38a95c6453b70df6ac90c6a6f6d20cb714bac3a8f31c2e1')

build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure -O ${PKGBUILD_HASKELL_ENABLE_PROFILING:+-p } --enable-split-objs --enable-shared \
       --prefix=/usr --docdir=/usr/share/doc/${pkgname} --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock
    runhaskell Setup register   --gen-script
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
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
