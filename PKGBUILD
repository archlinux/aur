# Maintainer: Yardena Cohen <yardenack at gmail dot com>

pkgname=haskell-largeword
_hkgname=largeword
pkgver=1.2.5
pkgrel=1
pkgdesc="Provides Word128, Word192 and Word256 and a way of producing other large words if required."
url="https://hackage.haskell.org/package/largeword"
license=('BSD3')
arch=('i686' 'x86_64')
makedepends=('ghc')
depends=('haskell-base')
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha256sums=('00b3b06d846649bf404f52a725c88349a38bc8c810e16c99f3100c4e1e9d7d46')
install="${pkgname}.install"

build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    
    runhaskell Setup configure -O --enable-shared --disable-library-vanilla \
               --enable-executable-dynamic \
               --prefix=/usr --docdir=/usr/share/doc/"${pkgname}" \
               --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid
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
    
}
