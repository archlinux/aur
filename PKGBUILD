# Maintainer: Hans-Dieter Buddenberg <hbuddenberg@gmail.com>
pkgname=hyprcaffeine
pkgver=2.0.0
pkgrel=1
pkgdesc='☕ Idle inhibition utility for Hyprland & Wayland compositors with Quickshell, Waybar, and Walker/Wofi menus'
arch=(any)
url='https://github.com/hbuddenberg/hyprcaffeine'
license=(MIT)
depends=(bash jq hyprland hypridle socat)
optdepends=(
    'quickshell: modern native QML modal menu and Omarchy status bar widget'
    'walker: application launcher menu frontend'
    'wofi: Wayland application launcher'
    'rofi-wayland: dmenu replacement for Wayland'
    'gum: interactive menu and styled prompts'
    'libnotify: desktop notifications'
)
install=hyprcaffeine.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9af346e0f10383084cb65442d7fb11922e456ea47a362163b754efd92354f5a6')

prepare() {
    cd "$srcdir/$pkgname-$pkgver" || return

    # Patch LIB_DIR in the binary to use the installed data path
    sed -i "s|LIB_DIR=\"\${SCRIPT_DIR}/../scripts\"|LIB_DIR=\"/usr/share/hyprcaffeine/scripts\"|" bin/hyprcaffeine

    # Patch service ExecStart to use the AUR binary path
    sed -i 's|__HC_BIN__|/usr/bin/hyprcaffeine|g' systemd/hyprcaffeine.service
}

package() {
    cd "$srcdir/$pkgname-$pkgver" || return

    # CLI binary
    install -Dm755 bin/hyprcaffeine "${pkgdir}/usr/bin/hyprcaffeine"

    # Library scripts
    install -dm755 "${pkgdir}/usr/share/hyprcaffeine/scripts"
    install -Dm755 scripts/*.sh "${pkgdir}/usr/share/hyprcaffeine/scripts/"

    # Quickshell UI Modal
    install -Dm644 ui/shell.qml "${pkgdir}/usr/share/hyprcaffeine/ui/shell.qml"

    # Omarchy Quickshell Bar Plugin
    install -dm755 "${pkgdir}/usr/share/hyprcaffeine/plugins/omarchy"
    install -Dm644 plugins/omarchy/manifest.json "${pkgdir}/usr/share/hyprcaffeine/plugins/omarchy/manifest.json"
    install -Dm644 plugins/omarchy/BarWidget.qml "${pkgdir}/usr/share/hyprcaffeine/plugins/omarchy/BarWidget.qml"

    # Default configuration
    install -Dm644 config/default.yaml "${pkgdir}/usr/share/hyprcaffeine/config/default.yaml"

    # UI dictionary (consumed by scripts/ui-engine.sh — must sit one dir above scripts/)
    install -Dm644 config/ui-dictionary.json "${pkgdir}/usr/share/hyprcaffeine/config/ui-dictionary.json"

    # Polkit rules (installed directly to system polkit rules dir)
    install -Dm644 config/polkit.rules "${pkgdir}/usr/share/polkit-1/rules.d/50-hyprcaffeine.rules"
    install -Dm644 config/polkit.rules "${pkgdir}/usr/share/hyprcaffeine/polkit.rules"

    # Systemd user service
    install -Dm644 systemd/hyprcaffeine.service "${pkgdir}/usr/share/hyprcaffeine/systemd/hyprcaffeine.service"

    # Waybar module template
    install -Dm644 waybar/module.json "${pkgdir}/usr/share/hyprcaffeine/waybar-module.json"

    # Waybar CSS
    install -Dm644 waybar/waybar-css.css "${pkgdir}/usr/share/hyprcaffeine/waybar-css.css"

    # Documentation
    install -dm755 "${pkgdir}/usr/share/doc/hyprcaffeine"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/hyprcaffeine/"
    if compgen -G "docs/*.md" > /dev/null; then
        install -Dm644 docs/*.md "${pkgdir}/usr/share/doc/hyprcaffeine/"
    fi

    # License
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
