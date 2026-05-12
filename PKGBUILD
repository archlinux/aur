# Maintainer: Origin Security <support@originhq.com>
pkgname=praxis
pkgver=0.9.29
pkgrel=1
pkgdesc='Praxis - Semantic Command & Control Framework for Agents'
arch=('x86_64')
url='https://github.com/originsec/praxis'
license=('Apache-2.0')
depends=('rabbitmq' 'gcc-libs' 'glibc')
makedepends=('cargo' 'git')
backup=('etc/praxis/env')
options=('!lto')
install=praxis.install
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/originsec/praxis/archive/v$pkgver.tar.gz"
    'praxis-service.service'
    'praxis-sysusers.conf'
    'praxis-tmpfiles.conf'
    'praxis.env'
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export SQLITE3_NO_PKG_CONFIG=1

    # Bundled C libraries (ring, mlua-sys) are compiled by the cc crate which
    # inherits CFLAGS. GCC LTO objects aren't compatible with rust-lld.
    unset CFLAGS CXXFLAGS LDFLAGS LTOFLAGS

    cargo build --frozen --release -p praxis_service -p praxis_cli -p praxis_node
}

package() {
    cd "$pkgname-$pkgver"

    # Binaries — service, CLI, node agent. The web server is intentionally
    # not installed; manage Praxis via the `praxis` TUI.
    install -Dm755 target/release/praxis_service "$pkgdir/usr/bin/praxis_service"
    install -Dm755 target/release/praxis_cli     "$pkgdir/usr/bin/praxis_cli"

    # `praxis` is the user-facing CLI name; `praxis_cli` is the underlying
    # binary. The CLI uses argv[0] for its display name.
    ln -s praxis_cli "$pkgdir/usr/bin/praxis"

    # praxisctl — wraps systemctl + edits /etc/praxis/env.
    install -Dm755 pkg/praxisctl/praxisctl "$pkgdir/usr/bin/praxisctl"

    # Node binary (filename matches what the service expects to ship to targets).
    install -Dm755 target/release/praxis_node "$pkgdir/usr/share/praxis/nodes/praxis_node_linux"

    # Systemd unit (single service; no umbrella).
    install -Dm644 "$srcdir/praxis-service.service" "$pkgdir/usr/lib/systemd/system/praxis-service.service"

    # sysusers/tmpfiles
    install -Dm644 "$srcdir/praxis-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/praxis.conf"
    install -Dm644 "$srcdir/praxis-tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/praxis.conf"

    # Config
    install -Dm644 "$srcdir/praxis.env" "$pkgdir/etc/praxis/env"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
