# $Id$
# Maintainer: Daniel Martí <mvdan@mvdan.cc>

_hkgname=hint
pkgname=haskell-hint
pkgver=0.6.0
pkgrel=1
pkgdesc="Runtime Haskell interpreter (GHC API wrapper)"
url="https://github.com/mvdan/$_hkgname"
license=('BSD')
arch=('i686' 'x86_64')
depends=('ghc')
makedepends=('haskell-directory' 'haskell-exceptions' 'haskell-filepath' 'haskell-ghc-paths' 'haskell-mtl' 'haskell-random')
source=("git+${url}#tag=v${pkgver}")
md5sums=('SKIP')
install="${pkgname}.install"

build() {
    cd "${srcdir}/${_hkgname}"
    
    runhaskell Setup configure -O --enable-library-profiling --enable-shared \
        --prefix=/usr --docdir="/usr/share/doc/${pkgbase}" --datasubdir="$pkgbase" \
        --libsubdir=\$compiler/site-local/\$pkgid \
            -fgpl -fthreaded
    runhaskell Setup build
    runhaskell Setup haddock --hoogle --html
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd "${srcdir}/${_hkgname}"
    
    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/${pkgname}/register.sh"
    install    -m744 unregister.sh "${pkgdir}/usr/share/haskell/${pkgname}/unregister.sh"
    install -d -m755 "${pkgdir}/usr/share/doc/ghc/html/libraries"
    ln -s "/usr/share/doc/${pkgname}/html" "${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}"
    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
