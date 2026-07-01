# Maintainer: Fred Mitchell <fred.mitchell@atomlogik.de>
pkgname=swiss-army-knife
pkgver=1.1.0.4
pkgrel=1
pkgdesc="A collection of small but powerful command-line tools"
arch=('x86_64')
url="https://github.com/flajann2/swiss-army-knife"
license=('MIT')
depends=('ghc-libs')
makedepends=('ghc')
source=("$pkgname-$pkgver.tar.gz::https://hackage.haskell.org/package/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('ccb7de74aec3497c4de1d2c4a832d261954420ae53885f5209e6a30289619d9f')

prepare() {
    cd "$pkgname-$pkgver"
    # Remove any pinned compiler so it builds with Arch's GHC
    sed -i '/^with-compiler:/d' cabal.project 2>/dev/null || true
}

build() {
    cd "$pkgname-$pkgver"
    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic \
        --prefix=/usr --docdir="/usr/share/doc/$pkgname" \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
        --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
        --ghc-option='-pie'
    runhaskell Setup build $MAKEFLAGS
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
}

package() {
    cd "$pkgname-$pkgver"

    install -D -m744 register.sh   "$pkgdir/usr/share/haskell/register/$pkgname.sh"
    install -D -m744 unregister.sh "$pkgdir/usr/share/haskell/unregister/$pkgname.sh"

    runhaskell Setup copy --destdir="$pkgdir"

    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    rm -f "$pkgdir/usr/share/doc/$pkgname/LICENSE"
}
