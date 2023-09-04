# Maintainer: Michael Dressel <mdrslmr@kloenplatz.de>
_hkgname=MultipletCombiner
pkgname=haskell-multipletcombiner
pkgver=0.0.4
pkgrel=3
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
sha512sums=('2b5b7ea95620d09a219c22190fa85715ed024b8dbf0125a84a8b317ddcd0152c6d44b4e5f3173dea5b4d6b49ed29b3f1e9139834fd66f59889f10cc3fc55e26c')

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
