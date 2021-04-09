# Maintainer: Yardena Cohen <yardenack at gmail dot com>

_hkgname=hsemail
pkgname=haskell-hsemail
pkgver=2.2.1
pkgrel=1
pkgdesc="Internet Message Parsers"
url="http://hackage.haskell.org/package/$_hkgname"
_licensefile=LICENSE
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=('ghc')
depends=("haskell-base" "sh" "haskell-mtl" "haskell-old-time" "haskell-parsec")
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=('b5ea99b4d98c988f1ca248a5641e3ecbe22b200cfcecfd1011fdaa93af961d81')

# PKGBUILD functions
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic \
       --disable-library-vanilla --prefix=/usr --docdir="/usr/share/doc/${pkgname}" \
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
    install -D -m644 ${_licensefile} ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/${_licensefile}
}
