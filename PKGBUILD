# Maintainer: Michael Dressel <mdrslmr@kloenplatz.de>
_hkgname=MultipletCombiner
pkgname=haskell-multipletcombiner
pkgver=0.0.6
pkgrel=2
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
sha256sums=('423187acd110ee518862b04f2b75b79a781a47b6f893aa35ac63c55fcab06ea2')

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
