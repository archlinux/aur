# $Id$
# Maintainer: Simon Kohlmeyer <simon.kohlmeyer@gmail.com>

_hkgname=gitHUD
pkgname=githud
pkgver=1.3.7
pkgrel=1
pkgdesc="heads up display for the command line that will show git information"
url="http://hackage.haskell.org/package/$_hkgname"
license=("BSD3")
arch=('x86_64')
depends=('ghc' 'ghc-libs' 'haskell-mtl' 'haskell-parsec' 'haskell-text' 'haskell-unix' 'haskell-process')
makedepends=('ghc')
source=(http://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz)
sha256sums=('dc38431b13d2dc4625987131c1389ed4ab67154990035c0c66f30d90d1a344af')

build() {
    cd "$srcdir/$_hkgname-$pkgver"

    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir="/usr/share/doc/${pkgname}" \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
        -fcurl -fpkgconfig -f-static -fterminfo -fthreaded -fexecutable \
        -f-rts -foptimize -f-warn-as-error -f-libiconv
    runhaskell Setup build
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd $_hkgname-$pkgver

    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
    install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
    runhaskell Setup copy --destdir="${pkgdir}"

    # The generated binary is called gitHUD, but it's probably convenient to be able to call it
    # githud instead
    ln -s gitHUD "${pkgdir}/usr/bin/githud"

    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
