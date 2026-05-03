# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpits
pkgver=0.3.0
pkgrel=1
pkgdesc="moshpits server — SSH and Mosh inspired remote terminal server written in Rust"
arch=('x86_64')
url="https://github.com/rustyhorde/moshpit"
license=('MIT' 'Apache-2.0')
depends=('moshpit-keygen')
makedepends=('cargo' 'cmake' 'gcc')
install=moshpits.install
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/rustyhorde/moshpit/archive/v$pkgver.tar.gz"
    "mps.service"
)
sha256sums=(
    '358c9d11d2a29103391f535a9a630ca58a82dbc9083d7e0e80e380fe9e18f777'
    # Local repo-tracked sidecar file; checksum is intentionally unmanaged in CI.
    '358c9d11d2a29103391f535a9a630ca58a82dbc9083d7e0e80e380fe9e18f777'
)

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
    cargo build --release --locked --bin mps
    cargo xtask dist mps
}

package() {
    cd "moshpit-$pkgver"

    # Binary
    install -Dm755 "target/release/mps" "$pkgdir/usr/bin/mps"

    # Man page
    install -Dm644 "dist/mps/mps.1" "$pkgdir/usr/share/man/man1/mps.1"

    # Shell completions
    install -Dm644 "dist/mps/mps.bash" \
        "$pkgdir/usr/share/bash-completion/completions/mps"
    install -Dm644 "dist/mps/_mps" \
        "$pkgdir/usr/share/zsh/site-functions/_mps"
    install -Dm644 "dist/mps/mps.fish" \
        "$pkgdir/usr/share/fish/vendor_completions.d/mps.fish"

    # systemd unit
    install -Dm644 "$srcdir/mps.service" \
        "$pkgdir/usr/lib/systemd/system/mps.service"

    # Example config
    install -Dm644 "packaging/arch/moshpits/examples/moshpits.toml.example" \
        "$pkgdir/usr/share/doc/$pkgname/examples/moshpits.toml.example"

    # Documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Licenses
    install -Dm644 LICENSE-MIT    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
