# Maintainer: Øyvind 'Mr.Elendig' Heggstad <mrelendig@har-ikkje.net>

pkgname=haskell-setlocale
pkgver=1.0.0.3
pkgrel=1
pkgdesc="Haskell bindings to setlocale"
url="http://hackage.haskell.org/package/setlocale"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedepends=()
depends=('ghc')
options=('strip' 'staticlibs')
install=${pkgname}.install
source=(http://hackage.haskell.org/packages/archive/setlocale/${pkgver}/setlocale-${pkgver}.tar.gz)
md5sums=('348690842f5233f0e42e16bd615f777e')

build() {
    cd ${srcdir}/setlocale-${pkgver}
    runhaskell Setup configure -O ${PKGBUILD_HASKELL_ENABLE_PROFILING:+-p } --enable-split-objs --enable-shared \
       --prefix=/usr --docdir=/usr/share/doc/${pkgname} --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock
    runhaskell Setup register   --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd ${srcdir}/setlocale-${pkgver}
    install -D -m744 register.sh   ${pkgdir}/usr/share/haskell/${pkgname}/register.sh
    install    -m744 unregister.sh ${pkgdir}/usr/share/haskell/${pkgname}/unregister.sh
    install -d -m755 ${pkgdir}/usr/share/doc/ghc/html/libraries
    ln -s /usr/share/doc/${pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/entropy
    runhaskell Setup copy --destdir=${pkgdir}
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
