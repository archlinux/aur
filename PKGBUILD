# Maintainer: Florian <ton-email@example.com>
pkgname=quickshell-games-launchers-git
pkgver=r61.8eaf105
pkgrel=1
pkgdesc="Quickshell game launcher for Hyprland with pywal/wallust integration"
arch=('any')
url="https://github.com/Eaquo/quickshell-games-launchers"
license=('MIT')
depends=(
    'quickshell'
    'python'
    'qt6-declarative'
)
optdepends=(
    'ttf-font-awesome-7: icônes de l interface (AUR)'
    'python-vdf: non-Steam game detection via shortcuts.vdf'
)
makedepends=('git')
provides=('quickshell-games-launchers')
conflicts=('quickshell-games-launchers')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "$pkgname"

    # ── Sources installées dans /usr/share (read-only, référence) ──────────
    install -dm755 "$pkgdir/usr/share/quickshell-games-launchers"
    cp -r game-launcher "$pkgdir/usr/share/quickshell-games-launchers/"

    # ── Licence ────────────────────────────────────────────────────────────
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    echo "MIT License — see $url" \
        > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # ── Wrapper /usr/bin/quickshell-game ───────────────────────────────────
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/quickshell-game" << 'EOF'
#!/usr/bin/env bash
# quickshell-game — Lance le Game Launcher depuis ~/.config/quickshell/

SHARE_DIR="/usr/share/quickshell-games-launchers/game-launcher"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/quickshell/game-launcher"

# ── Premier lancement : copie la structure dans ~/.config/quickshell/ ──────
if [[ ! -d "$CONFIG_DIR" ]]; then
    echo "[quickshell-game] Installation de la config dans $CONFIG_DIR ..."
    mkdir -p "$CONFIG_DIR"
    cp -r "$SHARE_DIR"/. "$CONFIG_DIR/"
    mkdir -p "$CONFIG_DIR/box-art"
    mkdir -p "$CONFIG_DIR/cache"
    echo ""
    echo "[quickshell-game] Config prête !"
    echo "  → Edite $CONFIG_DIR/config.toml pour configurer Steam / Heroic"
    echo "  → Ajoute tes jeux manuels dans $CONFIG_DIR/games.toml (si présent)"
    echo ""
fi

# ── Lancement ──────────────────────────────────────────────────────────────
exec quickshell -p "$CONFIG_DIR/shell.qml" "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/quickshell-game"
}
