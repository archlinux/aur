# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=dconf2nix
pkgver=0.1.1
pkgrel=1
pkgdesc="Convert Dconf files (e.g. Gnome Shell) to Nix, as expected by Home Manager"
url="https://github.com/gvolpe/dconf2nix"
license=('Apache-2.0')
arch=('i686' 'x86_64')
depends=('ghc-libs' 'haskell-emojis' 'haskell-optparse-applicative')
makedepends=('ghc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gvolpe/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('4e6f54adfd6d8ace8dc58ddd42f8faab2179fb66e20c41094236a553de7f22ed3d9168ef0549596f42c741fcccbcb02a09aeae04045ebf80899f6adede0e56c5')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
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
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
    install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
