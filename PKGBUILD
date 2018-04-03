# $Id$
# Maintainer: Simon Kohlmeyer <simon.kohlmeyer@gmail.com>

_hkgname=githud
pkgname=$_hkgname
pkgver=2.0.1
pkgrel=1
pkgdesc="heads up display for the command line that will show git information"
url="https://github.com/gbataille/gitHUD"
license=("BSD")
arch=('x86_64')
depends=('ghc' 'ghc-libs' 'haskell-mtl' 'haskell-parsec' 'haskell-text' 'haskell-unix' 'haskell-process')
makedepends=('ghc')
source=(http://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz)
sha256sums=('9096896544fa98b344dad27c856ab62fa691a9afe78dbdbb3834567d5b28ac62')

build() {
    cd "$srcdir/$_hkgname-$pkgver"

    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr \
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
    install -D -m644 LICENSE       "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    runhaskell Setup copy --destdir="${pkgdir}"

    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
