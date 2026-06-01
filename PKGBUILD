# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=bartoc
pkgver=1.5.1
pkgrel=1
pkgdesc="Barto job executor client"
arch=('x86_64')
url="https://github.com/rustyhorde/barto"
license=('MIT' 'Apache-2.0')
depends=()
optdepends=('logrotate: periodic cleanup of rotated log files'
            'xz: xz compression of rotated log files')
makedepends=('cargo')
install=bartoc.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/rustyhorde/barto/archive/v$pkgver.tar.gz")
sha256sums=('928562f240c5f3a62b67e6de8e4aac1060b222b21a0308fee44836c1e0a6ce1e')

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
    cargo build --release --locked --bin bartoc
    cargo xtask dist bartoc
}

package() {
    cd "barto-$pkgver"

    # Binary
    install -Dm755 "target/release/bartoc" "$pkgdir/usr/bin/bartoc"

    # Launcher script (loads secrets from systemd credentials or GNOME Keyring / KWallet)
    install -Dm755 "dist/bartoc/bartoc-launcher" "$pkgdir/usr/lib/bartoc/bartoc-launcher"

    # Interactive setup helper for systemd user credentials (lingering services)
    install -Dm755 "packaging/nfpm/scripts/bartoc-secrets-init" "$pkgdir/usr/bin/bartoc-secrets-init"

    # Man page
    install -Dm644 "dist/bartoc/bartoc.1" "$pkgdir/usr/share/man/man1/bartoc.1"

    # Shell completions
    install -Dm644 "dist/bartoc/bartoc.bash" \
        "$pkgdir/usr/share/bash-completion/completions/bartoc"
    install -Dm644 "dist/bartoc/_bartoc" \
        "$pkgdir/usr/share/zsh/site-functions/_bartoc"
    install -Dm644 "dist/bartoc/bartoc.fish" \
        "$pkgdir/usr/share/fish/vendor_completions.d/bartoc.fish"

    # Systemd user service
    install -Dm644 "dist/bartoc/bartoc.service" \
        "$pkgdir/usr/lib/systemd/user/bartoc.service"

    # Log rotation helper script
    install -Dm755 "dist/bartoc/bartoc-logrotate" \
        "$pkgdir/usr/lib/bartoc/bartoc-logrotate"

    # Systemd user timer for log rotation
    install -Dm644 "dist/bartoc/bartoc-logrotate.service" \
        "$pkgdir/usr/lib/systemd/user/bartoc-logrotate.service"
    install -Dm644 "dist/bartoc/bartoc-logrotate.timer" \
        "$pkgdir/usr/lib/systemd/user/bartoc-logrotate.timer"

    # Example config
    install -Dm644 "packaging/arch/bartoc/examples/bartoc.toml.example" \
        "$pkgdir/usr/share/doc/$pkgname/examples/bartoc.toml.example"

    # Documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Licenses
    install -Dm644 LICENSE-MIT    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
