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
sha256sums=('64e88c0f6817efef30a63ac191c15a17a4a73ed943b6ef0c28b0d8aa430b393d')

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
