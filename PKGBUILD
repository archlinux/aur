# Maintainer: Daniel Nagy <danielnagy at gmx de>

# custom variables
_hkgname=HsSyck
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-hssyck
pkgver=0.52
pkgrel=1
pkgdesc="Fast, lightweight YAML loader and dumper"
url="http://hackage.haskell.org/package/${_hkgname}"
license=("custom:BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc"
         "haskell-syb"
         "haskell-hashtables"
         "haskell-utf8-string")
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install=$pkgname.install
options=('strip' 'staticlibs')
sha256sums=('6c73bcbf8dee55e8a76a8dc9835201a2f995fe1c5c67f255f3f55f60ea9aacc1')

# PKGBUILD functions
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    
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
