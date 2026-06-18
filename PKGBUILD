# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpit
pkgver=0.9.1
pkgrel=1
pkgdesc="moshpit client — SSH and Mosh inspired remote terminal client written in Rust"
arch=('x86_64')
url="https://github.com/rustyhorde/moshpit"
license=('MIT' 'Apache-2.0')
depends=('moshpit-keygen')
makedepends=('cargo' 'cmake' 'gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rustyhorde/moshpit/archive/v$pkgver.tar.gz")
sha256sums=('0b08f576be87f6b8cee57fd42c4656523b756e2dfec94077d0f36633d1e327e4')

prepare() {
    cd "moshpit-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
    cd "moshpit-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export VERGEN_IDEMPOTENT=1
    cargo build --release --locked --bin mp
    cargo xtask dist mp
}

package() {
    cd "moshpit-$pkgver"

    # Binary
    install -Dm755 "target/release/mp" "$pkgdir/usr/bin/mp"

    # Man page
    install -Dm644 "dist/mp/mp.1" "$pkgdir/usr/share/man/man1/mp.1"

    # Shell completions
    install -Dm644 "dist/mp/mp.bash" \
        "$pkgdir/usr/share/bash-completion/completions/mp"
    install -Dm644 "dist/mp/_mp" \
        "$pkgdir/usr/share/zsh/site-functions/_mp"
    install -Dm644 "dist/mp/mp.fish" \
        "$pkgdir/usr/share/fish/vendor_completions.d/mp.fish"

    # Example config
    install -Dm644 "packaging/arch/moshpit/examples/moshpit.toml.example" \
        "$pkgdir/usr/share/doc/$pkgname/examples/moshpit.toml.example"

    # Documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Licenses
    install -Dm644 LICENSE-MIT    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
