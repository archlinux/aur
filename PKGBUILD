# Maintainer: 1746037389@qq.com

pkgname=cut-pet
pkgver=0.1.0
pkgrel=1
pkgdesc='Borderless Hyprland/Wayland desktop AI pet'
arch=('x86_64')
url='https://github.com/123llyrr/cut-pet'
license=('MIT')
depends=('quickshell' 'qt6-declarative' 'qt6-wayland' 'grim' 'wl-clipboard' 'procps-ng')
optdepends=(
  'hyprland: target compositor and cursor tracking integration'
  'slurp: fallback screenshot area selection'
  'codex: Codex AI backend'
  'opencode: OpenCode AI backend'
  'super-claude-code: Super Claude AI backend'
)
source=("${pkgname}::git+https://github.com/123llyrr/cut-pet.git")
sha256sums=('SKIP')

package() {
  install -dm755 "$pkgdir/usr/share/cut-pet"
  install -dm755 "$pkgdir/usr/bin"

  cp -r "$srcdir/cut-pet/cut-pet-ui" "$pkgdir/usr/share/cut-pet/"
  cp -r "$srcdir/cut-pet/scripts" "$pkgdir/usr/share/cut-pet/"
  install -Dm644 "$srcdir/cut-pet/SPEC.md" "$pkgdir/usr/share/cut-pet/SPEC.md"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/cut-pet" <<'WRAPPER'
#!/bin/sh
set -e
CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
SHELL_PATH="${CUT_PET_SHELL_PATH:-/usr/share/cut-pet/cut-pet-ui/shell.qml}"
mkdir -p "$CONFIG_HOME/cut-pet/screenshots"
exec quickshell --path "$SHELL_PATH"
WRAPPER

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/cut-pet-stop" <<'WRAPPER'
#!/bin/sh
set -e
ROOT="/usr/share/cut-pet"
SHELL_PATH="${CUT_PET_SHELL_PATH:-$ROOT/cut-pet-ui/shell.qml}"
kill_by_shell_path() {
  signal=${1:-TERM}
  for cmdline in /proc/[0-9]*/cmdline; do
    [ -r "$cmdline" ] || continue
    pid=${cmdline#/proc/}
    pid=${pid%/cmdline}
    [ "$pid" != "$$" ] || continue
    args=()
    while IFS= read -r -d '' arg; do args+=("$arg"); done < "$cmdline"
    [ ${#args[@]} -gt 0 ] || continue
    [ "${args[0]##*/}" == "quickshell" ] || continue
    has_path=0
    for arg in "${args[@]}"; do
      [ "$arg" = "$SHELL_PATH" ] && has_path=1 && break
    done
    [ "$has_path" = 1 ] && kill -"$signal" "$pid" 2>/dev/null || true
  done
}
quickshell kill --path "$SHELL_PATH" --any-display >/dev/null 2>&1 || true
kill_by_shell_path TERM
WRAPPER

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/cut-pet-restart" <<'WRAPPER'
#!/bin/sh
set -e
cut-pet-stop
exec cut-pet
WRAPPER

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/cut-pet.desktop" <<'DESKTOP'
[Desktop Entry]
Name=cut-pet
Comment=Borderless Hyprland/Wayland desktop AI pet
Exec=cut-pet
Icon=cut-pet
Terminal=false
Type=Application
Categories=Utility;
DESKTOP

  install -Dm644 /dev/stdin "$pkgdir/usr/share/icons/hicolor/scalable/apps/cut-pet.svg" <<'SVG'
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64">
  <rect width="64" height="64" rx="8" fill="#6c5ce7"/>
  <ellipse cx="32" cy="36" rx="20" ry="18" fill="#a29bfe"/>
  <circle cx="24" cy="30" r="6" fill="white"/>
  <circle cx="40" cy="30" r="6" fill="white"/>
  <circle cx="25" cy="31" r="3" fill="#2d3436"/>
  <circle cx="41" cy="31" r="3" fill="#2d3436"/>
  <ellipse cx="32" cy="42" rx="4" ry="2" fill="#fd79a8"/>
</svg>
SVG
}
