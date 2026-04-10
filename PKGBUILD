# Maintainer: LightJunction <lightjunction.me@gmail.com>
pkgname=mimic-node-git
pkgrel=1
pkgdesc="A stealthy, systemless sing-box node manager (Rust implementation)"
arch=('x86_64' 'aarch64')
url="https://github.com/LIghtJUNction/Mimic-Node"
license=('GPL-3.0-or-later')
depends=('sing-box' 'openssl' 'kmod' 'gcc-libs')
makedepends=('git' 'rust' 'cargo')
provides=('mimic-node')
conflicts=('mimic-node')
install='mimic-node.install'
source=('git+https://github.com/LIghtJUNction/Mimic-Node.git')
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/Mimic-Node"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
    cd "$srcdir/Mimic-Node"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    export CARGO_TARGET_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/cargo-target"
    cd "$srcdir/Mimic-Node"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen --all-features
}

check() {
    cd "$srcdir/Mimic-Node"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
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
    install -Dm644 "overlay/etc/systemd/system/sing-box.service.d/mimic-overlay.conf" "$pkgdir/etc/systemd/system/sing-box.service.d/mimic-overlay.conf"
    install -Dm644 "overlay/usr/share/mimic-node/sni.txt" "$pkgdir/usr/share/mimic-node/sni.txt"
    install -dm700 "$pkgdir/var/lib/mimic-node"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
