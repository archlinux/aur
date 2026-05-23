# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpit-agent
pkgver=0.8.6
pkgrel=1
pkgdesc="Moshpit agent daemon — holds identity keys in memory and serves them over a Unix socket (passphrase unlock)"
arch=('x86_64')
url="https://github.com/rustyhorde/moshpit"
license=('MIT' 'Apache-2.0')
depends=()
makedepends=('cargo' 'cmake' 'gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rustyhorde/moshpit/archive/v$pkgver.tar.gz")
sha256sums=('73fc457fd1c4a5e37e0181fef6cf987cd3237d237fe67cee5ebfc81b027822b8')

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
    cargo build --release --locked --bin mpa
    cargo xtask dist mpa
}

package() {
    cd "moshpit-$pkgver"

    # Binary
    install -Dm755 "target/release/mpa" "$pkgdir/usr/bin/mpa"

    # Man page
    install -Dm644 "dist/mpa/mpa.1" "$pkgdir/usr/share/man/man1/mpa.1"

    # Shell completions
    install -Dm644 "dist/mpa/mpa.bash" \
        "$pkgdir/usr/share/bash-completion/completions/mpa"
    install -Dm644 "dist/mpa/_mpa" \
        "$pkgdir/usr/share/zsh/site-functions/_mpa"
    install -Dm644 "dist/mpa/mpa.fish" \
        "$pkgdir/usr/share/fish/vendor_completions.d/mpa.fish"

    # systemd user units
    install -Dm644 "dist/mpa/moshpit-agent.service" \
        "$pkgdir/usr/lib/systemd/user/moshpit-agent.service"
    install -Dm644 "dist/mpa/moshpit-agent.socket" \
        "$pkgdir/usr/lib/systemd/user/moshpit-agent.socket"

    # Documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Licenses
    install -Dm644 LICENSE-MIT    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
