pkgname=haskell-shelly
_hkgname=shelly
pkgver=1.6.8.4
pkgrel=1
pkgdesc="Convenient systems programming in Haskell"
url="https://github.com/yesodweb/Shelly.hs"
license=('BSD3')
arch=('i686' 'x86_64')
depends=('haskell-async' 'haskell-enclosed-exceptions' 'haskell-exceptions' 'haskell-lifted-async' 'haskell-lifted-base' 'haskell-monad-control' 'haskell-mtl' 'haskell-system-fileio' 'haskell-system-filepath' 'haskell-text' 'haskell-transformers-base' 'haskell-unix-compat')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('337dc3fa511859ad0fec35f1721a60a5896abce766423d49e2441107f84210ee7354b26fc6d0f41b433e1a996e020cdb42fb1dca3cd165c8c3fa5b4d9e20dc07')

build() {
    cd "${srcdir}/${_hkgname}-${pkgver}"

    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic \
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

    # Remove static libs
    find "$pkgdir"/usr/lib -name "*.a" -delete
}
