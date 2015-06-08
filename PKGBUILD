# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Don Stewart <dons@galois.com>

pkgname=haskell-unix-compat
_hkgname=unix-compat
_licensefile=LICENSE
pkgver=0.4.1.4
pkgrel=1
pkgdesc="Portable POSIX-compatibility layer."
url="http://hackage.haskell.org/package/unix-compat"
license=('BSD3')
arch=('i686' 'x86_64')
makedepends=('ghc')
depends=('haskell-old-time' 'haskell-directory')
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha256sums=('fafa1a9eefc93287c028cc61f17a91f886f164b3f64392f1756f8a7f8b3cb34b')
install="${pkgname}.install"

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
