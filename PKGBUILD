# Maintainer: Michael Dressel <mdrslmr@kloenplatz.de>
_hkgname=MultipletCombiner
pkgname=haskell-multipletcombiner
pkgver=0.0.5
pkgrel=1
pkgdesc="A Haskell implementation for combining SU(n) multiplets"
arch=('x86_64')
url="https://github.com/mdrslmr/MultipletCombiner"
license=('BSD')
#groups=()
depends=('ghc-libs' 'haskell-call-stack')
makedepends=('ghc')
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
#changelog=
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
#noextract=()
sha512sums=('3b0a7d9e5cccb68a549460bed285e23cf6ab1fd91bf75cc3457003d8d96d7eb2a7b3b443583cfa665e4e21e1f0813d259d3d4c54d866b2cb13c96c7f27d4511f')

build() {
    cd $_hkgname-$pkgver

    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir=/usr/share/doc/$pkgname --datasubdir=$pkgname \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid --ghc-option=-fllvm \
            -fbase4
    runhaskell Setup build $MAKEFLAGS
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd $_hkgname-$pkgver

    install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
    install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
    runhaskell Setup copy --destdir="$pkgdir"
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}
