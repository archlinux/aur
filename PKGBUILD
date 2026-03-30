# Maintainer: Victor Sosa <victorsosaMX@github>
pkgname=vshypr-theme-manager
pkgver=1.0.0
pkgrel=1
pkgdesc="Unified theming system for Arch Linux + Hyprland — 44 themes, 16 apps, GTK3 GUI"
arch=('any')
url="https://github.com/victorsosaMX/vshypr-theme-manager"
license=('MIT')
depends=(
    'python'
    'python-gobject'
    'python-cairo'
)
optdepends=(
    'rofi-wayland: selector visual de temas desde terminal'
    'matugen: temas dinámicos generados desde wallpaper'
    'awww: transiciones de wallpaper con awww-daemon'
    'jq: procesamiento JSON en rofi-picker.sh'
    'swaync: theming del centro de notificaciones'
    'qt5ct: theming de aplicaciones Qt5'
    'qt6ct: theming de aplicaciones Qt6'
    'kvantum: motor de estilos SVG para Qt'
    'nautilus: gestor de archivos GTK4 (auto-reinicio tras aplicar tema)'
    'dolphin: gestor de archivos Qt (auto-reinicio tras aplicar tema)'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f9abd0af28758529b7dc1fc89c9ba4d22490e4480d1e616ea9020a9ca9760598')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # ── ejecutable GUI ─────────────────────────────────────────────────────────
    install -Dm755 vshypr-theme-manager \
        "$pkgdir/usr/bin/vshypr-theme-manager"

    # Logo junto al ejecutable (lo busca _SCRIPT_DIR en el GUI)
    install -Dm644 vshypr-theme-manager.png \
        "$pkgdir/usr/bin/vshypr-theme-manager.png"

    # ── integración con el escritorio ──────────────────────────────────────────
    install -Dm644 vshypr-theme-manager.desktop \
        "$pkgdir/usr/share/applications/vshypr-theme-manager.desktop"

    install -Dm644 vshypr-theme-manager.png \
        "$pkgdir/usr/share/pixmaps/vshypr-theme-manager.png"

    # ── datos compartidos (/usr/share) ─────────────────────────────────────────
    # En el primer arranque del GUI se copian a ~/.config/vshypr-theme-manager/
    local share="$pkgdir/usr/share/vshypr-theme-manager"
    install -d "$share"

    install -Dm755 vshypr-theme-manager.py "$share/vshypr-theme-manager.py"
    install -Dm755 rofi-picker.sh           "$share/rofi-picker.sh"

    cp -r themes    "$share/"
    cp -r templates "$share/"
    cp -r assets    "$share/"

    # ── licencia ───────────────────────────────────────────────────────────────
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
