# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=salus
pkgver=0.1.3
pkgrel=1
pkgdesc="Local secret store: a key/value store guarded by Shamir secret shares and AES-256-GCM encryption (daemon + client + login agent)"
arch=('x86_64')
url="https://github.com/rustyhorde/salus"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo' 'cmake' 'clang')
install=salusd.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/rustyhorde/salus/archive/v$pkgver.tar.gz")
sha256sums=('1b181e62926bb1d83abf97d5bb9c304892d29a37ddb31a6eba3dc4c6dc3c50fb')

prepare() {
    cd "salus-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
    cd "salus-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --locked --bin salusd --bin salusc --bin salus-agent
    cargo run --release --locked -p xtask -- dist salusd
    cargo run --release --locked -p xtask -- dist salusc
    cargo run --release --locked -p xtask -- dist salus-agent
}

package() {
    cd "salus-$pkgver"

    # Binaries
    install -Dm755 "target/release/salusd" "$pkgdir/usr/bin/salusd"
    install -Dm755 "target/release/salusc" "$pkgdir/usr/bin/salusc"
    install -Dm755 "target/release/salus-agent" "$pkgdir/usr/bin/salus-agent"

    # Man pages
    install -Dm644 "dist/salusd/salusd.1" "$pkgdir/usr/share/man/man1/salusd.1"
    install -Dm644 "dist/salusc/salusc.1" "$pkgdir/usr/share/man/man1/salusc.1"
    install -Dm644 "dist/salus-agent/salus-agent.1" "$pkgdir/usr/share/man/man1/salus-agent.1"

    # Shell completions
    install -Dm644 "dist/salusd/salusd.bash" \
        "$pkgdir/usr/share/bash-completion/completions/salusd"
    install -Dm644 "dist/salusc/salusc.bash" \
        "$pkgdir/usr/share/bash-completion/completions/salusc"
    install -Dm644 "dist/salus-agent/salus-agent.bash" \
        "$pkgdir/usr/share/bash-completion/completions/salus-agent"
    install -Dm644 "dist/salusd/_salusd" \
        "$pkgdir/usr/share/zsh/site-functions/_salusd"
    install -Dm644 "dist/salusc/_salusc" \
        "$pkgdir/usr/share/zsh/site-functions/_salusc"
    install -Dm644 "dist/salus-agent/_salus-agent" \
        "$pkgdir/usr/share/zsh/site-functions/_salus-agent"
    install -Dm644 "dist/salusd/salusd.fish" \
        "$pkgdir/usr/share/fish/vendor_completions.d/salusd.fish"
    install -Dm644 "dist/salusc/salusc.fish" \
        "$pkgdir/usr/share/fish/vendor_completions.d/salusc.fish"
    install -Dm644 "dist/salus-agent/salus-agent.fish" \
        "$pkgdir/usr/share/fish/vendor_completions.d/salus-agent.fish"

    # systemd user units for the daemon and the agent
    install -Dm644 "packaging/systemd/salusd.service" \
        "$pkgdir/usr/lib/systemd/user/salusd.service"
    install -Dm644 "packaging/systemd/salus-agent.service" \
        "$pkgdir/usr/lib/systemd/user/salus-agent.service"

    # Example config
    install -Dm644 "packaging/arch/salus/examples/salusd.toml.example" \
        "$pkgdir/usr/share/doc/$pkgname/examples/salusd.toml.example"
    install -Dm644 "packaging/arch/salus/examples/salus-agent.toml.example" \
        "$pkgdir/usr/share/doc/$pkgname/examples/salus-agent.toml.example"

    # Documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Licenses
    install -Dm644 LICENSE-MIT    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
