# Maintainer: João Freitas <joaj.freitas@gmail.com>
pkgname=numbat
_pkgname=numbat-cli
pkgver=1.7.0
pkgrel=1
pkgdesc="A statically typed programming language for scientific computations with first class support for physical dimensions and units"
arch=('any')
url="https://github.com/sharkdp/numbat"
license=('MIT' 'Apache-2.0')
depends=() 
makedepends=(cargo)
provides=(numbat)
source=(
  "$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$_pkgname/$_pkgname-$pkgver.crate" 
  "v$pkgver::https://github.com/sharkdp/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
)

sha512sums=(
  '0b3b606a5088bf3b4fac526f74c2e595bbad2f58fa87f372b7bfea616df950f3a162f80a1b3d8e2e4624c0f8a5c4623addc2fe013145530c434db4d6cd7c2d7a'
  '10c3693f427b3518223e4f0a30c4583a16abb616c510e03247fca2cbae7dcc70f01fe3da8ea4c8509b8e6e31a155c82a713c9b73bc1e7252c79550da081de4be'
)

prepare() {
    cd $_pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd $_pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd $_pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname-$pkgver/target/release/$pkgname"
    mkdir -p "$pkgdir/usr/share/$pkgname"
    cp -r  "$pkgname-$pkgver/$pkgname/modules" "$pkgdir/usr/share/$pkgname"
    install -Dm644 "$pkgname-$pkgver/LICENSE-MIT" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 "$pkgname-$pkgver/LICENSE-APACHE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 "$pkgname-$pkgver/README.md" "$pkgdir/usr/doc/$pkgname/README.md"
}
