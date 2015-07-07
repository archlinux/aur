# Maintainer: William J. Bowman <aur@williamjbowman.com>
_hkgname=data-hash
pkgname=haskell-data-hash
pkgver=0.2.0.1
pkgrel=2
pkgdesc="Combinators for building fast hashing functions."
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedepends=()
depends=('ghc' 'haskell-array' 'haskell-containers')
options=('strip' 'staticlibs')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
sha256sums=('9117dd49013ca28ff188fc71c3595ac3af23d56d301c1f39bac93d44d8c60bbe')
sha512sums=('daea098b9c808396606d90ae70e5156c492463db929b563a6195ee648ad72fc2949ab231ad67758fe0c68991826ea2292109a5d1f46d0cfc27c16e2e2b0666fa')
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure -O \
      ${PKGBUILD_HASKELL_ENABLE_PROFILING:+-p } \
      --enable-split-objs \
      --enable-shared \
      --prefix=/usr \
      --docdir=/usr/share/doc/${pkgname} \
      --libsubdir=\$compiler/site-local/\$pkgid
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
