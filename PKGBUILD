# Maintainer: Origin Security <support@originhq.com>
pkgname=praxis
pkgver=0.9.18
pkgrel=1
pkgdesc='Praxis - Semantic Command & Control Framework for Agents'
arch=('x86_64')
url='https://github.com/originsec/praxis'
license=('Apache-2.0')
depends=('rabbitmq' 'gcc-libs' 'glibc')
makedepends=('cargo' 'npm' 'git')
backup=('etc/praxis/env')
options=('!lto')
install=praxis.install
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/originsec/praxis/archive/v$pkgver.tar.gz"
    'praxis.service'
    'praxis-service.service'
    'praxis-web.service'
    'praxis-sysusers.conf'
    'praxis-tmpfiles.conf'
    'praxis.env'
)
sha256sums=(
    'bb03eaee5668f323385f6fecccc41d2b3bbe759e3acbc9de4d75e805102149a4'
    'SKIP'
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

    cargo build --frozen --release -p praxis_service -p praxis_web -p praxis_cli -p praxis_node
}

package() {
    cd "$pkgname-$pkgver"

    # Binaries
    install -Dm755 target/release/praxis_service "$pkgdir/usr/bin/praxis_service"
    install -Dm755 target/release/praxis_web "$pkgdir/usr/bin/praxis_web"
    install -Dm755 target/release/praxis_cli "$pkgdir/usr/bin/praxis_cli"

    # Node binary (for distribution to targets, filename must match web UI expectations)
    install -Dm755 target/release/praxis_node "$pkgdir/usr/share/praxis/nodes/praxis_node_linux"

    # Systemd units
    install -Dm644 "$srcdir/praxis.service" "$pkgdir/usr/lib/systemd/system/praxis.service"
    install -Dm644 "$srcdir/praxis-service.service" "$pkgdir/usr/lib/systemd/system/praxis-service.service"
    install -Dm644 "$srcdir/praxis-web.service" "$pkgdir/usr/lib/systemd/system/praxis-web.service"

    # sysusers/tmpfiles
    install -Dm644 "$srcdir/praxis-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/praxis.conf"
    install -Dm644 "$srcdir/praxis-tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/praxis.conf"

    # Config
    install -Dm644 "$srcdir/praxis.env" "$pkgdir/etc/praxis/env"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
