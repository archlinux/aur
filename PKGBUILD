# Maintainer: MajorX234 <majorx234 at gmail dot com>

_hkgname=bindings-GLFW
pkgname=haskell-bindings-glfw
pkgver=3.3.9.2
pkgrel=1
pkgdesc="Low-level bindings to GLFW"
url="https://github.com/bsl/bindings-GLFW.git"
license=('MIT')
arch=('i686' 'x86_64')
depends=('ghc-libs' 'haskell-bindings-dsl')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('e9465d88d648f8e958c6294f1e0115ce797bb268b3a1035cb0d8e6225d0884bf8e72db77a9aec8221552ea13ed21f6e60b9b3a96266db92685d003e1ff2cf689')

build() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir="/usr/share/doc/${pkgname}" \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
    install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
