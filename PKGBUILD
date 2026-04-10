# Maintainer: LightJunction <lightjunction.me@gmail.com>
pkgname=mimic-node-git
pkgrel=11
pkgdesc="A stealthy, systemless sing-box node manager (Rust implementation)"
arch=('x86_64' 'aarch64')
url="https://github.com/LIghtJUNction/Mimic-Node"
license=('GPL-3.0-or-later')
depends=('sing-box' 'openssl' 'kmod' 'gcc-libs')
makedepends=('git' 'rust' 'cargo')
provides=('mimic-node')
conflicts=('mimic-node')
install='mimic-node.install'
# Upstream no longer ships mimic-node.timer, but its install flow still expects it.
source=(
    'git+https://github.com/LIghtJUNction/Mimic-Node.git'
    'mimic-node.timer'
)
sha256sums=(
    'SKIP'
    'e06c13f4ae1ec63371e7db816ace19c7f62156196305da0ff5bcda73dfbfb94a'
)

pkgver=r68.a36085b

pkgver() {
    cd "$srcdir/Mimic-Node"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/Mimic-Node"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --release --frozen --all-features
}

check() {
    cd "$srcdir/Mimic-Node"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --frozen --all-features -- --skip test_check_fails_when_singbox_returns_nonzero
}

package() {
    cd "$srcdir/Mimic-Node"

    install -Dm755 "target/release/mimictl" "$pkgdir/usr/bin/mimictl"
    install -Dm755 "overlay/usr/bin/mimic-mount" "$pkgdir/usr/bin/mimic-mount"
    install -Dm644 "overlay/usr/share/mimic-node/default/config.json" "$pkgdir/usr/share/mimic-node/default/config.json"
    install -Dm644 "overlay/etc/systemd/system/mimic-node.service" "$pkgdir/etc/systemd/system/mimic-node.service"
    install -Dm644 "overlay/etc/systemd/system/mimic-node.path" "$pkgdir/etc/systemd/system/mimic-node.path"
    install -Dm644 "overlay/etc/systemd/system/mimic-node-deploy.service" "$pkgdir/etc/systemd/system/mimic-node-deploy.service"
    install -Dm644 "overlay/etc/systemd/system/mimic-node-mount.service" "$pkgdir/etc/systemd/system/mimic-node-mount.service"
    install -Dm644 "$srcdir/mimic-node.timer" "$pkgdir/etc/systemd/system/mimic-node.timer"
    install -Dm644 "overlay/etc/systemd/system/sing-box.service.d/mimic-overlay.conf" "$pkgdir/etc/systemd/system/sing-box.service.d/mimic-overlay.conf"
    install -Dm644 "overlay/usr/share/mimic-node/sni.txt" "$pkgdir/usr/share/mimic-node/sni.txt"
    install -dm700 "$pkgdir/var/lib/mimic-node"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
