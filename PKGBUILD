# Maintainer: Daniel Nagy <danielnagy at gmx de>

# custom variables
_hkgname=archlinux
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-archlinux
pkgver=1.3
pkgrel=3
pkgdesc="Support for working with Arch Linux packages."
url="http://github.com/archhaskell/"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz" "ghc74.patch")
install="${pkgname}.install"
# PKGBUILD functions
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    patch -Np1 -i "${srcdir}/ghc74.patch" || return 1
    
    runhaskell Setup configure -O -p --enable-split-objs --enable-shared \
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
sha256sums=('a2cb945735719b5e40450ac9d5d8d6fe1b2b4c90043ce43040b82397867d3714'
            '95b5c4a9696e46ea36476536796a880195f82913962d713bb7d911c7d1cb788d')
