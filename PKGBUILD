# Maintainer: Yardena Cohen <yardenack at gmail dot com>

_hkgname=codec-mbox
pkgname=haskell-${_hkgname}
pkgver=0.2.0.0
pkgrel=1
pkgdesc="A library to read and write mailboxes in mbox format"
url="http://hackage.haskell.org/package/${_hkgname}"
_licensefile=LICENSE
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=('ghc')
depends=(ghc-static haskell-fclabels)
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
md5sums=("7b4a3820d61a105e8ef6080b4dc44b2e")
sha256sums=("94094b42a472016be310aba00f25a8f442231c9820be08539337786a9e39764d")
sha512sums=("a03472f4600d1536b2681953625b3c8fc167ac9628585842be68344d6727e007fff17e85896864c69185f428d040d784bbbc8e44cc421c60523586ff4bb150c2")

# PKGBUILD functions
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    
    runhaskell Setup configure -O ${PKGBUILD_HASKELL_ENABLE_PROFILING:+-p } --enable-shared \
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
