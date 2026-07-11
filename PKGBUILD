# Maintainer: Fred Mitchell <fred.mitchell@atomlogik.de>
pkgname=swiss-army-knife
pkgver=1.1.0.5
pkgrel=1
pkgdesc="A collection of small but powerful command-line tools"
arch=('x86_64')
url="https://github.com/flajann2/swiss-army-knife"
license=('MIT')
makedepends=('ghc' 'ghc-static' 'cabal-install' 'zlib' 'libgmp-static')
source=("$pkgname-$pkgver.tar.gz::https://hackage.haskell.org/package/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('940b528ff9c792bab000acceac3b40f59c9febd5988f40fe47a15d44d91febb1')

prepare() {
    cd "$pkgname-$pkgver"
    # Remove any pinned compiler
    sed -i '/^with-compiler:/d' cabal.project 2>/dev/null || true
    # Pre-download dependencies (speeds up build)
    cabal update
    cabal build --only-dependencies -j$(nproc) --enable-executable-static
}

build() {
    cd "$pkgname-$pkgver"
    cabal build -j$(nproc) --enable-executable-static
}

check() {
    cd "$pkgname-$pkgver"
    # Fail the build here if it's not actually static, instead of shipping
    # a broken dynamic binary to users
    local bin
    bin="$(cabal list-bin sak)"
    if ! file "$bin" | grep -q 'statically linked'; then
        echo "ERROR: sak was not statically linked!"
        file "$bin"
        return 1
    fi
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$(cabal list-bin sak)" "$pkgdir/usr/bin/sak"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
