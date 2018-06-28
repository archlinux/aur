# $Id$
# Maintainer: Simon Kohlmeyer <simon.kohlmeyer@gmail.com>

_hkgname=githud
pkgname=$_hkgname
pkgver=2.0.2
pkgrel=1
pkgdesc="heads up display for the command line that will show git information"
url="https://github.com/gbataille/gitHUD"
license=("BSD")
arch=('x86_64')
depends=('ghc' 'ghc-libs' 'haskell-mtl' 'haskell-parsec' 'haskell-text' 'haskell-unix' 'haskell-process')
makedepends=('ghc')
source=(http://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz)
sha512sums=('e55063d125593a9a4417f6380be7472fcb7ba52b96cb2835c5a5edd402741936e7873706ed343db9d80c57caa42e546f5e6c5810b3906225229ee413d2628d88')

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
