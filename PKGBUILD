pkgname=v2ray-rs
pkgver=0.22.1
pkgrel=1
pkgdesc="Linux desktop GUI for v2ray/xray/sing-box proxy management"
arch=('x86_64')
url="https://github.com/victorzhuk/v2ray-rs"
license=('Apache-2.0')
# ring's pregenerated C objects fail to link under GCC LTO.
options=('!lto')
depends=('gtk4' 'libadwaita' 'dbus' 'libcap')
makedepends=('rust' 'cargo' 'protobuf')
optdepends=(
    'v2ray: V2Ray proxy backend'
    'xray: Xray proxy backend'
    'sing-box: sing-box proxy backend'
    'polkit: one-time TUN privilege grant via pkexec'
)
install=v2ray-rs.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('de9333b001c986212ecfd776274644cb976c8771201e4295edb7ba452e6987a0')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release -p v2ray-rs-ui -p v2ray-rs-netctl -p v2ray-rs-run -p v2ray-rs-antidpi
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/v2ray-rs-ui" "$pkgdir/usr/bin/v2ray-rs"
    # Privileged helpers. The install hook creates the `v2ray-rs` group,
    # restricts these to it (netctl 0750 + cap_net_admin, antidpi 0750 +
    # cap_net_admin,cap_net_raw, run 4750 setuid), and creates the bypass user.
    # Modes here are the pre-hook defaults.
    install -Dm755 "target/release/v2ray-rs-netctl" "$pkgdir/usr/bin/v2ray-rs-netctl"
    # Archives never carry the setuid bit: the install hook applies root:v2ray-rs
    # and 4750 after systemd-sysusers has created the group and bypass user.
    install -Dm755 "target/release/v2ray-rs-run" "$pkgdir/usr/bin/v2ray-rs-run"
    # Anti-DPI engine (NFQUEUE desync strategies): the hook applies the
    # cap_net_admin,cap_net_raw file capabilities.
    install -Dm755 "target/release/v2ray-rs-antidpi" "$pkgdir/usr/bin/v2ray-rs-antidpi"
    install_icon "assets/v2ray-rs.svg" \
        "crates/ui/icons/hicolor/scalable/apps/com.github.v2ray-rs.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.github.v2ray-rs.svg"
    install_optional "assets/v2ray-rs.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.github.v2ray-rs.png"
    install_icon "crates/ui/icons/hicolor/symbolic/apps/com.github.v2ray-rs-symbolic.svg" \
        "assets/v2ray-rs-symbolic.svg" \
        "$pkgdir/usr/share/icons/hicolor/symbolic/apps/com.github.v2ray-rs-symbolic.svg"
    install_icon "assets/com.github.v2ray-rs.desktop" \
        "crates/ui/assets/com.github.v2ray-rs.desktop" \
        "$pkgdir/usr/share/applications/com.github.v2ray-rs.desktop"
    local lang
    for lang in en_US ru_RU; do
        install -Dm644 "locale/$lang/LC_MESSAGES/v2ray-rs.mo" \
            "$pkgdir/usr/share/locale/$lang/LC_MESSAGES/v2ray-rs.mo"
    done
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

install_icon() {
    local primary=$1
    local fallback=$2
    local dest=$3

    if [[ -f "$primary" ]]; then
        install -Dm644 "$primary" "$dest"
        return
    fi

    if [[ -f "$fallback" ]]; then
        install -Dm644 "$fallback" "$dest"
        return
    fi

    echo "Missing icon asset: $primary or $fallback" >&2
    return 1
}

install_optional() {
    local src=$1
    local dest=$2

    if [[ -f "$src" ]]; then
        install -Dm644 "$src" "$dest"
    fi
}
