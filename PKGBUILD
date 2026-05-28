# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=barto-cli
pkgver=1.4.1
pkgrel=1
pkgdesc="Barto command-line interface for querying bartos instances"
arch=('x86_64')
url="https://github.com/rustyhorde/barto"
license=('MIT' 'Apache-2.0')
depends=()
makedepends=('cargo')
install=barto-cli.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/rustyhorde/barto/archive/v$pkgver.tar.gz")
sha256sums=('1ff0f2ccf7b233c089128cb5e8b58afe22fad1e06a3d0cd641385862a6acb157')

prepare() {
    cd "barto-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
    cd "barto-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export VERGEN_IDEMPOTENT=1
    cargo build --release --locked --bin barto-cli
    cargo xtask dist barto-cli
}

package() {
    cd "barto-$pkgver"

    # Binary
    install -Dm755 "target/release/barto-cli" "$pkgdir/usr/bin/barto-cli"

    # Man page
    install -Dm644 "dist/barto-cli/barto-cli.1" "$pkgdir/usr/share/man/man1/barto-cli.1"

    # Shell completions
    install -Dm644 "dist/barto-cli/barto-cli.bash" \
        "$pkgdir/usr/share/bash-completion/completions/barto-cli"
    install -Dm644 "dist/barto-cli/_barto-cli" \
        "$pkgdir/usr/share/zsh/site-functions/_barto-cli"
    install -Dm644 "dist/barto-cli/barto-cli.fish" \
        "$pkgdir/usr/share/fish/vendor_completions.d/barto-cli.fish"

    # Example config
    install -Dm644 "packaging/arch/barto-cli/examples/barto-cli.toml.example" \
        "$pkgdir/usr/share/doc/$pkgname/examples/barto-cli.toml.example"

    # Documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Licenses
    install -Dm644 LICENSE-MIT    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
