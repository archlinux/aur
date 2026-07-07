# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>

pkgname=ttl
pkgver=0.21.0
pkgrel=1
pkgdesc="Fast, modern traceroute with real-time TUI, per-hop stats, ASN/geo lookup, and ECMP detection."
url="https://github.com/lance0/ttl"
license=('MIT' 'Apache-2.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lance0/ttl/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bbc26008b9ee2879a08b0262016522e795c0c80c0f34f1936b5715536cca3358')
arch=('x86_64')
depends=('gcc-libs')
makedepends=('cargo')
options=(!lto)
provides=('ttl')
conflicts=('ttl-bin')
install=ttl.install

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Shell completions
    "$pkgdir/usr/bin/$pkgname" --completions bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    "$pkgdir/usr/bin/$pkgname" --completions zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
    "$pkgdir/usr/bin/$pkgname" --completions fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
}
