pkgname=v2ray-rs-bin
_pkgname=v2ray-rs
pkgver=0.22.1
pkgrel=1
pkgdesc="Linux desktop GUI for v2ray/xray/sing-box proxy management (prebuilt)"
arch=('x86_64')
url="https://github.com/victorzhuk/v2ray-rs"
license=('Apache-2.0')
depends=('gtk4' 'libadwaita' 'dbus' 'libcap')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
optdepends=(
    'v2ray: V2Ray proxy backend'
    'xray: Xray proxy backend'
    'sing-box: sing-box proxy backend'
    'polkit: one-time TUN privilege grant via pkexec'
)
install=v2ray-rs.install
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/v2ray-rs-$CARCH-linux.tar.gz")
sha256sums=('82a5f38f8e90e2147b4aaf394ff450d58dc3a76d17d87c65d171c1317b423e3b')

package() {
    cd "$_pkgname-$pkgver-$CARCH-linux"

    install -Dm755 "bin/v2ray-rs" "$pkgdir/usr/bin/v2ray-rs"
    # Privileged helpers. The install hook creates the `v2ray-rs` group,
    # restricts these to it (netctl 0750 + cap_net_admin, antidpi 0750 +
    # cap_net_admin,cap_net_raw, run 4750 setuid), and creates the bypass user.
    # Modes here are the pre-hook defaults.
    install -Dm755 "bin/v2ray-rs-netctl" "$pkgdir/usr/bin/v2ray-rs-netctl"
    # Archives never carry the setuid bit: the install hook applies root:v2ray-rs
    # and 4750 after systemd-sysusers has created the group and bypass user.
    install -Dm755 "bin/v2ray-rs-run" "$pkgdir/usr/bin/v2ray-rs-run"
    # Anti-DPI engine (NFQUEUE desync strategies): the hook applies the
    # cap_net_admin,cap_net_raw file capabilities.
    install -Dm755 "bin/v2ray-rs-antidpi" "$pkgdir/usr/bin/v2ray-rs-antidpi"

    install -Dm644 "share/applications/com.github.v2ray-rs.desktop" \
        "$pkgdir/usr/share/applications/com.github.v2ray-rs.desktop"
    install -Dm644 "share/icons/hicolor/scalable/apps/com.github.v2ray-rs.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.github.v2ray-rs.svg"
    install -Dm644 "share/icons/hicolor/symbolic/apps/com.github.v2ray-rs-symbolic.svg" \
        "$pkgdir/usr/share/icons/hicolor/symbolic/apps/com.github.v2ray-rs-symbolic.svg"
    install -Dm644 "share/icons/hicolor/256x256/apps/com.github.v2ray-rs.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.github.v2ray-rs.png"

    local lang
    for lang in en_US ru_RU; do
        install -Dm644 "share/locale/$lang/LC_MESSAGES/v2ray-rs.mo" \
            "$pkgdir/usr/share/locale/$lang/LC_MESSAGES/v2ray-rs.mo"
    done

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
