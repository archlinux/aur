# Maintainer: Hans-Dieter Buddenberg <hbuddenberg@gmail.com>
pkgname=hyprcaffeine
pkgver=0.9.0
pkgrel=1
pkgdesc='☕ Idle inhibition utility for Hyprland — caffeine for your Wayland compositor'
arch=(any)
url='https://github.com/hbuddenberg/hyprcaffeine'
license=(MIT)
depends=(bash jq hyprland hypridle socat)
optdepends=(
    'gum: interactive menu and styled prompts'
    'libnotify: desktop notifications'
    'walker: menu frontend'
)
install=hyprcaffeine.install
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v0.9.0/$pkgname-$pkgver.tar.gz")
sha256sums=('8d75f9e467f56d0d4ee2a23adced7ee7657ab33a8e190e85e3c81ba14240a94f')

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

    # Default configuration
    install -Dm644 config/default.yaml "${pkgdir}/usr/share/hyprcaffeine/config/default.yaml"

    # UI dictionary (consumed by scripts/ui-engine.sh — must sit one dir above scripts/)
    install -Dm644 config/ui-dictionary.json "${pkgdir}/usr/share/hyprcaffeine/config/ui-dictionary.json"

    # Polkit rule template
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
    install -Dm644 docs/*.md "${pkgdir}/usr/share/doc/hyprcaffeine/"

    # License
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
