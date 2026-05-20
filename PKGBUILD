# Maintainer: Hans-Dieter Buddenberg <hbuddenberg@gmail.com>
pkgname=hyprcaffeine
pkgver=0.7.5
pkgrel=1
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
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/hyprcaffeine-0.7.5.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::$url/releases/download/v$pkgver/hyprcaffeine-0.7.5.tar.gz.asc")
sha256sums=('2169c0d148c749a7c3adc6d5d2c9ed94de7288532d46fbf94d5a4bc645478062'
            'SKIP')
validpgpkeys=('CB0AA694A56137DB11084E824ED65735F926B2F7')

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
