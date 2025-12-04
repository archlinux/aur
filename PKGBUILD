# Maintainer: wakaka6 <your-email@example.com>
pkgname=claude-code-relay
pkgver=0.2.0
pkgrel=1
pkgdesc="High-performance AI API relay service for Claude, Gemini, and OpenAI"
arch=('x86_64' 'aarch64')
url="https://github.com/wakaka6/claude-code-relay"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('cc-relay-server')
backup=('etc/cc-relay-server/config.toml')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/wakaka6/claude-code-relay/archive/refs/tags/v$pkgver.tar.gz"
    "cc-relay-server.service"
    "cc-relay-server.sysusers"
    "cc-relay-server.tmpfiles"
)
sha256sums=(
    'a73ec49af76352d0276afe5ced773a08f3e06db81a31bc2303fb54fe9db7c171'
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
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "target/release/cc-relay-server" "$pkgdir/usr/bin/cc-relay-server"

    install -Dm644 "config.example.toml" "$pkgdir/etc/cc-relay-server/config.toml"
    install -Dm644 "config.example.toml" "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 "$srcdir/cc-relay-server.service" "$pkgdir/usr/lib/systemd/system/cc-relay-server.service"
    install -Dm644 "$srcdir/cc-relay-server.sysusers" "$pkgdir/usr/lib/sysusers.d/cc-relay-server.conf"
    install -Dm644 "$srcdir/cc-relay-server.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/cc-relay-server.conf"
}
