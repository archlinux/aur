# Maintainer: Hans-Dieter Buddenberg <hbuddenberg@gmail.com>
pkgname=hyprcaffeine
pkgver=0.7.4
pkgrel=2
pkgdesc='☕ Idle inhibition utility for Hyprland — caffeine for your Wayland compositor'
arch=(any)
url='https://github.com/hbuddenberg/hyprcaffeine'
license=(MIT)
depends=(bash jq hyprland socat)
optdepends=(
    'gum: interactive menu and styled prompts'
    'libnotify: desktop notifications'
    'walker: menu frontend'
)
install=hyprcaffeine.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/6fb2702fc9be6915906f0508ca32cb7f0e130f1b.tar.gz")
sha256sums=('d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed')

prepare() {
    cd "$(find "$srcdir" -maxdepth 1 -type d -name 'hyprcaffeine*' | head -1)" || return

    # Patch LIB_DIR in the binary to use the installed data path
    sed -i "s|LIB_DIR=\"\${SCRIPT_DIR}/../scripts\"|LIB_DIR=\"/usr/share/hyprcaffeine/scripts\"|" bin/hyprcaffeine
}

package() {
    cd "$(find "$srcdir" -maxdepth 1 -type d -name 'hyprcaffeine*' | head -1)" || return

    # CLI binary
    install -Dm755 bin/hyprcaffeine "${pkgdir}/usr/bin/hyprcaffeine"

    # Library scripts
    install -dm755 "${pkgdir}/usr/share/hyprcaffeine/scripts"
    install -Dm755 scripts/*.sh "${pkgdir}/usr/share/hyprcaffeine/scripts/"

    # Default configuration
    install -Dm644 config/default.yaml "${pkgdir}/usr/share/hyprcaffeine/config/default.yaml"

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
