# Maintainer: Michael Dressel <mdrslmr@kloenplatz.de>
_hkgname=MultipletCombiner
pkgname=haskell-multipletcombiner
pkgver=0.0.3
pkgrel=1
pkgdesc="A Haskell implementation for combining SU(n) multiplets"
arch=('x86_64')
url="https://github.com/mdrslmr/MultipletCombiner"
license=('BSD')
#groups=()
depends=('ghc-libs' 'haskell-call-stack')
makedepends=('ghc')
optdepends=('haskell-hunit: for unit tests')
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
#changelog=
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
#noextract=()
sha512sums=(ca22b4efcaff4001b1b41f406fac0077b60ef6b56e97c969deb5bc806471a88f501ead757542573412b55f74c593c271923131a23b17b0ab7c969303dba9147e)

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
