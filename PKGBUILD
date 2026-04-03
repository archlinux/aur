# Maintainer: Florian <eaquo@protonmail.com>
pkgname=quickshell-games-launchers-git
pkgver=r70.c2de546
pkgrel=2
pkgdesc="Quickshell game launcher for Hyprland with pywal/wallust integration"
arch=('any')
url="https://github.com/Eaquo/quickshell-games-launchers"
license=('MIT')
depends=(
    'quickshell'
    'python'
    'qt6-declarative'
    'python-vdf'
    'python-evdev'
)
optdepends=(
    'ttf-font-awesome-7: icônes de l interface (AUR)'
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

    # ── Sources dans /usr/share (read-only, référence) ─────────────────────
    install -dm755 "$pkgdir/usr/share/quickshell-games-launchers"
    cp -r game-launcher "$pkgdir/usr/share/quickshell-games-launchers/"

    # ── Licence ────────────────────────────────────────────────────────────
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    echo "MIT License — see $url" \
        > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # ── Wrapper /usr/bin/quickshell-game ───────────────────────────────────
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/quickshell-game" << 'WRAPPER'
#!/usr/bin/env bash
# quickshell-game — Lance le Game Launcher depuis ~/.config/quickshell/

SHARE_DIR="/usr/share/quickshell-games-launchers/game-launcher"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/quickshell/game-launcher"

# ── Fichiers utilisateur à ne JAMAIS écraser ──────────────────────────────
USER_FILES=(
    "config.toml"
    "games.toml"
    "box-art"
    "cache"
)

# ── Premier lancement : copie tout ────────────────────────────────────────
if [[ ! -d "$CONFIG_DIR" ]]; then
    echo "[quickshell-game] Premier lancement — installation dans $CONFIG_DIR ..."
    mkdir -p "$CONFIG_DIR"
    cp -r "$SHARE_DIR"/. "$CONFIG_DIR/"
    mkdir -p "$CONFIG_DIR/box-art"
    mkdir -p "$CONFIG_DIR/cache"
    echo ""
    echo "[quickshell-game] Config prête !"
    echo "  → Édite $CONFIG_DIR/config.toml pour configurer Steam / Heroic"
    echo ""

# ── Mise à jour : copie uniquement les fichiers non-utilisateur ───────────
else
    # Parcourt les fichiers du share
    while IFS= read -r -d '' src_file; do
        rel="${src_file#$SHARE_DIR/}"           # chemin relatif
        dst_file="$CONFIG_DIR/$rel"

        # Vérifie si ce fichier est protégé
        protected=false
        for uf in "${USER_FILES[@]}"; do
            if [[ "$rel" == "$uf" || "$rel" == "$uf/"* ]]; then
                protected=true
                break
            fi
        done

        if [[ "$protected" == true ]]; then
            # Copie seulement si le fichier n'existe pas encore (nouveau fichier)
            if [[ ! -e "$dst_file" ]]; then
                mkdir -p "$(dirname "$dst_file")"
                cp "$src_file" "$dst_file"
                echo "[quickshell-game] Nouveau fichier : $rel"
            fi
        else
            # Fichier non-utilisateur : toujours mettre à jour (QML, scripts)
            mkdir -p "$(dirname "$dst_file")"
            cp "$src_file" "$dst_file"
        fi
    done < <(find "$SHARE_DIR" -type f -print0)
fi

# ── Lancement ──────────────────────────────────────────────────────────────
exec quickshell -p "$CONFIG_DIR/shell.qml" "$@"
WRAPPER
    chmod 755 "$pkgdir/usr/bin/quickshell-game"
}
