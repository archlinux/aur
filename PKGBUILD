# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=bartos
pkgver=1.5.9
pkgrel=1
pkgdesc="Barto central job scheduling server"
arch=('x86_64')
url="https://github.com/rustyhorde/barto"
license=('MIT' 'Apache-2.0')
depends=()
optdepends=('mariadb: local database server'
            'logrotate: periodic cleanup of rotated log files'
            'xz: xz compression of rotated log files')
makedepends=('cargo')
install=bartos.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/rustyhorde/barto/archive/v$pkgver.tar.gz")
sha256sums=('a4572be21b6d89d3ac317ba270eb2e480ea276cc67eaf17fa9f49685aa93fdad')

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
    export SQLX_OFFLINE=true
    cargo build --release --locked --bin bartos
    cargo xtask dist bartos
}

package() {
    cd "barto-$pkgver"

    # Binary
    install -Dm755 "target/release/bartos" "$pkgdir/usr/bin/bartos"

    # Launcher script (reads systemd credentials, exports as env vars)
    install -Dm755 "dist/bartos/bartos-launcher" "$pkgdir/usr/lib/bartos/bartos-launcher"

    # Secrets init helper
    install -Dm755 "packaging/nfpm/scripts/bartos-secrets-init" "$pkgdir/usr/bin/bartos-secrets-init"

    # Migration helper
    install -Dm755 "packaging/nfpm/scripts/barto-migrate" "$pkgdir/usr/bin/barto-migrate"

    # Database migrations
    install -dm755 "$pkgdir/usr/share/bartos/migrations"
    install -m644 migrations/*.sql "$pkgdir/usr/share/bartos/migrations/"

    # Man page
    install -Dm644 "dist/bartos/bartos.1" "$pkgdir/usr/share/man/man1/bartos.1"

    # Shell completions
    install -Dm644 "dist/bartos/bartos.bash" \
        "$pkgdir/usr/share/bash-completion/completions/bartos"
    install -Dm644 "dist/bartos/_bartos" \
        "$pkgdir/usr/share/zsh/site-functions/_bartos"
    install -Dm644 "dist/bartos/bartos.fish" \
        "$pkgdir/usr/share/fish/vendor_completions.d/bartos.fish"

    # Systemd service
    install -Dm644 "dist/bartos/bartos.service" \
        "$pkgdir/usr/lib/systemd/system/bartos.service"

    # Log rotation helper script
    install -Dm755 "dist/bartos/bartos-logrotate" \
        "$pkgdir/usr/lib/bartos/bartos-logrotate"

    # Systemd timer for log rotation
    install -Dm644 "dist/bartos/bartos-logrotate.service" \
        "$pkgdir/usr/lib/systemd/system/bartos-logrotate.service"
    install -Dm644 "dist/bartos/bartos-logrotate.timer" \
        "$pkgdir/usr/lib/systemd/system/bartos-logrotate.timer"

    # Example config
    install -Dm644 "packaging/arch/bartos/examples/bartos.toml.example" \
        "$pkgdir/usr/share/doc/$pkgname/examples/bartos.toml.example"

    # Documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Licenses
    install -Dm644 LICENSE-MIT    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
