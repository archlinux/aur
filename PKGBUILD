# Maintainer: Siavash Sameni <manwe at manko dot yoga>
pkgname=btest-rs
pkgver=0.6.0
pkgrel=1
pkgdesc="MikroTik Bandwidth Test (btest) server and client with EC-SRP5 auth"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/manawenuz/btest-rs"
license=('MIT' 'Apache-2.0')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/manawenuz/btest-rs/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

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

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/btest" "$pkgdir/usr/bin/btest"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "docs/man/btest.1" "$pkgdir/usr/share/man/man1/btest.1"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

    # systemd service
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/system/btest.service" <<EOF
[Unit]
Description=MikroTik Bandwidth Test Server (btest-rs)
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
ExecStart=/usr/bin/btest -s
Restart=always
RestartSec=5
DynamicUser=yes
NoNewPrivileges=yes
ProtectSystem=strict
ProtectHome=yes
PrivateTmp=yes
AmbientCapabilities=CAP_NET_BIND_SERVICE
CapabilityBoundingSet=CAP_NET_BIND_SERVICE
LimitNOFILE=65535

[Install]
WantedBy=multi-user.target
EOF
}
