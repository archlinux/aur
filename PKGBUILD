# Maintainer: Fred Mitchell <fred.mitchell@atomlogik.de>
pkgname=swiss-army-knife
pkgver=1.1.0.4
pkgrel=1
pkgdesc="A collection of small but powerful command-line tools"
arch=('x86_64')
url="https://github.com/flajann2/swiss-army-knife"
license=('MIT')
depends=('ghc-libs')
makedepends=('ghc' 'cabal-install')
source=("$pkgname-$pkgver.tar.gz::https://hackage.haskell.org/package/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('ccb7de74aec3497c4de1d2c4a832d261954420ae53885f5209e6a30289619d9f')

prepare() {
    cd "$pkgname-$pkgver"
    # Remove any pinned compiler
    sed -i '/^with-compiler:/d' cabal.project 2>/dev/null || true
}

build() {
    cd "$pkgname-$pkgver"
    cabal update
    cabal build --enable-shared --enable-executable-dynamic
}

package() {
    cd "$pkgname-$pkgver"

    # Install the binary cleanly
    install -Dm755 dist-newstyle/build/*/*/x86_64-linux/ghc-*/swiss-army-knife-*/x/sak/build/sak/sak \
        "$pkgdir/usr/bin/sak" 2>/dev/null || \
    cabal install --installdir="$pkgdir/usr/bin" --install-method=copy --overwrite-policy=always

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
