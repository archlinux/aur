# Maintainer: João Freitas <joaj.freitas@gmail.com>
pkgname=numbat
_pkgname=numbat-cli
pkgver=1.9.0
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
  '5cecba702a4570ad8cb6a5ec12c8ff789153a86314548961b1f866dcf1c4031ea4976a6600b11b01b299f70b970aa2ec22785c2aceb0201e38251e673ba463c5'
  '873a78881e62883ac7e296ea044105b2413382188a95e40989333a119cd6ca5d030fbda6dba3f1fcb656891f7694e193395d4daa7e0cca29b8c3b1821bc217b0'
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
    #cargo test --frozen --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname-$pkgver/target/release/$pkgname"
    mkdir -p "$pkgdir/usr/share/$pkgname"
    cp -r  "$pkgname-$pkgver/$pkgname/modules" "$pkgdir/usr/share/$pkgname"
    install -Dm644 "$pkgname-$pkgver/LICENSE-MIT" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 "$pkgname-$pkgver/LICENSE-APACHE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 "$pkgname-$pkgver/README.md" "$pkgdir/usr/doc/$pkgname/README.md"
}
