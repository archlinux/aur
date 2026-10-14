# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: LightJunction <lightjunction.me@gmail.com>
pkgname=mimic-node
pkgver=0.2.0
pkgrel=2
pkgdesc='An OverlayFS-based sing-box Reality node manager'
arch=('x86_64' 'aarch64')
url='https://github.com/LIghtJUNction/Mimic-Node'
license=('GPL-3.0-or-later')
depends=('bash' 'glibc' 'gcc-libs' 'openssl' 'ca-certificates' 'sing-box>=1.14'
         'systemd' 'util-linux' 'kmod' 'e2fsprogs' 'iproute2' 'coreutils')
makedepends=('cargo' 'python')
optdepends=('certbot: provision TLS certificates separately for Hysteria2'
            'github-cli: GitHub Gist subscriptions'
            'curl: public address discovery fallback'
            'iptables: firewall diagnostics')
provides=('mimictl')
conflicts=('mimic-node-git')
install=mimic-node.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7c2bb958e922fc2155fa69575e8b784dd6e7eff0a287659d32dde2a6eabd1a67')

_cargo_env() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_HOME="$srcdir/cargo-home"
    export CARGO_TARGET_DIR=target
}

prepare() {
    cd "Mimic-Node-$pkgver" || return 1
    _cargo_env
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
    cd "Mimic-Node-$pkgver" || return 1
    _cargo_env
    cargo build --release --all-features --frozen
}

check() {
    cd "Mimic-Node-$pkgver" || return 1
    _cargo_env
    cargo test --all-features --frozen
    python -B -m unittest discover -s tests -p 'test_packaging.py' -v
    python -B scripts/smoke-test.py --binary target/debug/mimictl
}

package() {
    cd "Mimic-Node-$pkgver" || return 1
    install -Dm755 target/release/mimictl "$pkgdir/usr/bin/mimictl"
    install -Dm755 overlay/usr/bin/mimic-mount "$pkgdir/usr/bin/mimic-mount"
    install -Dm644 overlay/usr/share/mimic-node/default/config.json \
        "$pkgdir/usr/share/mimic-node/default/config.json"
    install -Dm644 overlay/usr/share/mimic-node/sni.txt "$pkgdir/usr/share/mimic-node/sni.txt"
    local unit
    for unit in overlay/etc/systemd/system/mimic-node.* \
        overlay/etc/systemd/system/mimic-node-{mount,deploy}.service; do
        install -Dm644 "$unit" "$pkgdir/usr/lib/systemd/system/${unit##*/}"
    done
    install -Dm644 overlay/etc/systemd/system/sing-box.service.d/mimic-overlay.conf \
        "$pkgdir/usr/lib/systemd/system/sing-box.service.d/mimic-overlay.conf"
    install -dm700 "$pkgdir/var/lib/mimic-node"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
