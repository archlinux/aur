pkgname=dynamic-glacier-git
pkgver=r15.gf0e6d20
pkgrel=1
pkgdesc="An experimental dynamic-island style widget for Hyprland, built with QML + Quickshell"
arch=('any')
url="https://github.com/mavxa/DynamicGlacier"
license=('MIT')
depends=(
  'bluez-utils'
  'fontconfig'
  'hyprland'
  'libpulse'
  'networkmanager'
  'noto-fonts'
  'pipewire'
  'playerctl'
  'psmisc'
  'qt6-5compat'
  'qt6-declarative'
  'quickshell'
  'ttf-material-symbols-variable'
  'upower'
)
optdepends=(
  'kitty: WiFi settings via nmtui'
  'bluedevil: Bluetooth device wizard'
)
makedepends=('git')
provides=('dynamic-glacier')
conflicts=('dynamic-glacier')
install=dynamic-glacier.install
source=("dynamic-glacier::git+https://github.com/mavxa/DynamicGlacier.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/dynamic-glacier"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/dynamic-glacier"

  install -dm755 "$pkgdir/usr/share/dynamic-glacier"
  cp -r --no-preserve=ownership quickshell "$pkgdir/usr/share/dynamic-glacier/"

  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/dynamic-glacier" <<'EOF'
#!/usr/bin/env sh
HYPR_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/hypr"
EXEC_LINE="exec-once = dynamic-glacier"
MARKER_FILE="${XDG_STATE_HOME:-$HOME/.local/state}/dynamic-glacier/autostart-done"

# First-run autostart registration
if [ ! -f "$MARKER_FILE" ] && [ -d "$HYPR_DIR" ]; then
    target=""
    if [ -f "$HYPR_DIR/custom/execs.conf" ]; then
        target="$HYPR_DIR/custom/execs.conf"
    elif [ -f "$HYPR_DIR/hyprland.conf" ]; then
        target="$HYPR_DIR/hyprland.conf"
    fi

    if [ -n "$target" ] && ! grep -qF "dynamic-glacier" "$target" 2>/dev/null; then
        printf '\n%s\n' "$EXEC_LINE" >> "$target"
    fi

    mkdir -p "$(dirname "$MARKER_FILE")"
    touch "$MARKER_FILE"
fi

exec quickshell --path /usr/share/dynamic-glacier/quickshell "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/dynamic-glacier"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/architecture.md "$pkgdir/usr/share/doc/$pkgname/architecture.md"
  install -Dm644 docs/development.md "$pkgdir/usr/share/doc/$pkgname/development.md"
}
