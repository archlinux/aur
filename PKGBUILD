# Maintainer: William J. Bowman <aur@williamjbowman.com>

# custom variables
_hkgname=geniplate
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-geniplate
pkgver=0.6.0.5
pkgrel=3
pkgdesc="Use template Haskell to generate Uniplate-like functions"
url="http://hackage.haskell.org/package/geniplate-${pkgver}"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc" "haskell-mtl")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=('ec6bb3509d4882f6382166735c6dcd87faae60bd58eb70cd7190503c8bf39c05')
sha512sums=('37127fa364ef0a8c67abbbadc025b932ddc62aaf09e4096548263c140b232b5442889d24f18fbb4ed3ea5eb0643b6afb4634b73471a2ec35b626dcd0c1781987')

# PKGBUILD functions
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
