# Maintainer: Hans-Dieter Buddenberg <hbuddenberg@gmail.com>
pkgname=hyprcaffeine
pkgver=0.7.2
pkgrel=4
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc")
sha256sums=("9b9f8da221002cc95af41db87b6549661ec6f08ade8599f095e0e273870a542f"
            "761a1053bde60a690a307279f6a6e28ec5f4c9027a3290350e9a9e3349458e65")
validpgpkeys=("CB0AA694A56137DB11084E824ED65735F926B2F7")

prepare() {
    cd "$srcdir/$pkgname-$pkgver" || return

    # Patch LIB_DIR in the binary to use the installed data path
    sed -i "s|LIB_DIR=\"\${SCRIPT_DIR}/../scripts\"|LIB_DIR=\"/usr/share/hyprcaffeine/scripts\"|" bin/hyprcaffeine
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
