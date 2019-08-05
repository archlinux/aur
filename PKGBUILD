# Maintainer: Solomon Choina <shlomochoina@gmail.com>
_hkgname=broadcast-chan
pkgname=haskell-broadcast-chan
pkgver=0.2.0.2
pkgrel=2
pkgdesc="Closable, fair, single-wakeup channel type that avoids 0 reader space leaks"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('BSD3')
arch=('x86_64')
makedepends=('ghc')
depends=('ghc-libs' 'haskell-unliftio-core')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
sha256sums=('5b82b575997e733f825b7ef642cb102c55ae00be3480ef22479a8d98fc195d89')

build() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir="/usr/share/doc/${pkgname}" \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup register   --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    install -D -m744 register.sh   ${pkgdir}/usr/share/haskell/register/${pkgname}.sh
    install -D -m744 unregister.sh ${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh
    runhaskell Setup copy --destdir=${pkgdir}
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
