# Maintainer: Florian <eaquo@protonmail.com>
pkgname=quickshell-games-launchers-git
pkgver=r138.08b1a17
pkgrel=1
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
    cp -r . "$pkgdir/usr/share/quickshell-games-launchers/game-launcher"

    # ── Licence ────────────────────────────────────────────────────────────
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    echo "MIT License — see $url" \
        > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib/quickshell-games-launchers"
    install -dm755 "$pkgdir/usr/share/libalpm/hooks"

    # ── Script de sync utilisateur (logique partagée) ──────────────────────
    # Appelé en tant que l'utilisateur concerné (pas root)
    # Usage : quickshell-games-sync-user [CONFIG_DIR]
    cat > "$pkgdir/usr/lib/quickshell-games-launchers/sync-user.sh" << 'SYNC_USER'
#!/usr/bin/env bash
SHARE_DIR="/usr/share/quickshell-games-launchers/game-launcher"
CONFIG_DIR="${1:-${XDG_CONFIG_HOME:-$HOME/.config}/quickshell/game-launcher}"

# Fichiers appartenant à l'utilisateur — ne jamais écraser
USER_FILES=(
    "config.toml"
    "games.toml"
    "favorites.json"
    "box-art"
    "cache"
)

[[ -d "$CONFIG_DIR" ]] || exit 0

while IFS= read -r -d '' src_file; do
    rel="${src_file#$SHARE_DIR/}"
    dst_file="$CONFIG_DIR/$rel"

    protected=false
    for uf in "${USER_FILES[@]}"; do
        if [[ "$rel" == "$uf" || "$rel" == "$uf/"* ]]; then
            protected=true; break
        fi
    done

    if [[ "$protected" == false ]]; then
        # Fichier QML/script : toujours mettre à jour
        mkdir -p "$(dirname "$dst_file")"
        cp "$src_file" "$dst_file"
    elif [[ ! -e "$dst_file" ]]; then
        # Fichier utilisateur absent (nouveau) : copier une première fois
        mkdir -p "$(dirname "$dst_file")"
        cp "$src_file" "$dst_file"
    fi
done < <(find "$SHARE_DIR" -type f -print0)
SYNC_USER
    chmod 755 "$pkgdir/usr/lib/quickshell-games-launchers/sync-user.sh"

    # ── Script de sync global (appelé par le hook pacman, en root) ────────
    # Itère sur tous les utilisateurs réels qui ont déjà le config dir
    cat > "$pkgdir/usr/bin/quickshell-games-sync" << 'SYNC_ALL'
#!/usr/bin/env bash
SYNC_USER_SCRIPT="/usr/lib/quickshell-games-launchers/sync-user.sh"

while IFS=: read -r username _ uid _ _ home _; do
    [[ "$uid" -ge 1000 ]] || continue   # ignorer les comptes système
    config_dir="$home/.config/quickshell/game-launcher"
    [[ -d "$config_dir" ]] || continue  # ignorer les utilisateurs sans install
    runuser -u "$username" -- "$SYNC_USER_SCRIPT" "$config_dir"
done < /etc/passwd
SYNC_ALL
    chmod 755 "$pkgdir/usr/bin/quickshell-games-sync"

    # ── Hook pacman : sync automatique après install/upgrade ──────────────
    cat > "$pkgdir/usr/share/libalpm/hooks/quickshell-games-launchers.hook" << 'HOOK'
[Trigger]
Operation = Install
Operation = Upgrade
Type = Package
Target = quickshell-games-launchers-git

[Action]
Description = Mise a jour des fichiers QuickShell Game Launcher...
When = PostTransaction
Exec = /usr/bin/quickshell-games-sync
HOOK

    # ── Wrapper /usr/bin/quickshell-game ───────────────────────────────────
    cat > "$pkgdir/usr/bin/quickshell-game" << 'WRAPPER'
#!/usr/bin/env bash
# quickshell-game — Lance le Game Launcher depuis ~/.config/quickshell/

SHARE_DIR="/usr/share/quickshell-games-launchers/game-launcher"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/quickshell/game-launcher"

# ── Premier lancement : copie tout ────────────────────────────────────────
if [[ ! -d "$CONFIG_DIR" ]]; then
    echo "[quickshell-game] Premier lancement — installation dans $CONFIG_DIR ..."
    mkdir -p "$CONFIG_DIR"
    cp -r "$SHARE_DIR"/. "$CONFIG_DIR/"
    mkdir -p "$CONFIG_DIR/box-art" "$CONFIG_DIR/cache"
    echo ""
    echo "[quickshell-game] Config prête !"
    echo "  → Édite $CONFIG_DIR/config.toml pour configurer Steam / Heroic"
    echo ""
else
    # ── Mise à jour : sync des fichiers non-utilisateur ───────────────────
    /usr/lib/quickshell-games-launchers/sync-user.sh "$CONFIG_DIR"
fi

# ── Lancement ──────────────────────────────────────────────────────────────
exec quickshell -p "$CONFIG_DIR/shell.qml" "$@"
WRAPPER
    chmod 755 "$pkgdir/usr/bin/quickshell-game"
}
