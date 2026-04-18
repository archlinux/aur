# Maintainer: LightJunction <lightjunction.me@gmail.com>
pkgname=mimic-node-git
pkgrel=4
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

pkgver=r78.c427d5b

pkgver() {
    cd "$srcdir/Mimic-Node"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/Mimic-Node"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --release --all-features
}

check() {
    cd "$srcdir/Mimic-Node"
    export RUSTUP_TOOLCHAIN=stable
    # Skip tests that require ./target/debug/mimictl (release builds use ./target/release/mimictl)
    # Skip overlay-dependent tests in release mode
    cargo test --release --frozen --all-features -- \
        --skip test_check_fails_when_singbox_returns_nonzero \
        --skip test_cli_ \
        --skip test_add_requires_email \
        --skip test_del_requires_targets \
        --skip test_info_requires_targets \
        --skip test_invalid_command \
        --skip test_reset_user_requires_targets \
        --skip test_update_requires_targets \
        --skip test_uuid_generation \
        --skip test_link_generation_requires_email \
        --skip test_link_generation_help \
        --skip test_from_link_requires_input \
        --skip test_sni_command_help \
        --skip test_add_user_with_level \
        --skip test_delete_with_dry_run \
        --skip test_update_user_level \
        --skip test_reset_user_dry_run \
        --skip test_list_users \
        --skip test_list_users_json \
        --skip test_info_single_user \
        --skip test_info_multiple_users \
        --skip test_info_with_json \
        --skip test_hysteria2_add_user_help \
        --skip test_dns_add_server_help \
        --skip test_dns_setup_doh3_help \
        --skip test_verify_config_path \
        --skip test_verify_link \
        --skip test_upgrade_dry_run \
        --skip test_upgrade_auto \
        --skip test_diagnose_verbose \
        --skip test_discard_items \
        --skip test_link_with_v4_flag \
        --skip test_link_with_v6_flag \
        --skip test_link_with_num
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
