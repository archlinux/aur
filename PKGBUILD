# Maintainer: Victor Coscrato <vcoscrato@users.noreply.github.com>

pkgname=quickdash-git
pkgver=r4.g0cbe7d2
pkgrel=1
pkgdesc="Configurable Hyprland dashboard and launcher built with Quickshell"
arch=('any')
url="https://github.com/vcoscrato/quickdash"
license=('MIT')
depends=(
  'bash'
  'bluez-utils'
  'coreutils'
  'hyprland'
  'libnotify'
  'networkmanager'
  'pipewire'
  'procps-ng'
  'quickshell>=0.3.0'
  'systemd'
  'which'
  'wireplumber'
)
makedepends=('git')
optdepends=(
  'curl: weather lookup'
  'brightnessctl: brightness controls'
  'cliphist: clipboard history'
  'hyprsunset: night-light controls'
  'wl-clipboard: restoring clipboard history entries'
  'xdg-utils: opening the config when VISUAL and EDITOR are unset'
)
provides=('quickdash')
conflicts=('quickdash')
source=("quickdash::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd quickdash
  printf 'r%s.g%s' \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd quickdash

  install -d "$pkgdir/usr/share/quickdash"
  install -m644 shell.qml config.example.jsonc "$pkgdir/usr/share/quickdash/"
  cp -r components core services theme widgets "$pkgdir/usr/share/quickdash/"

  install -Dm644 README.md "$pkgdir/usr/share/doc/quickdash/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/quickdash" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

readonly app_dir="${QUICKDASH_QML_DIR:-/usr/share/quickdash}"
readonly config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/quickdash"
readonly data_dir="${XDG_DATA_HOME:-$HOME/.local/share}/quickdash"
readonly config_file="$config_dir/config.jsonc"

if [[ ! -r "$app_dir/shell.qml" ]]; then
  printf 'quickdash: shell.qml not found in %s\n' "$app_dir" >&2
  exit 1
fi

install -d -m755 "$config_dir" "$data_dir"

if [[ ! -e "$config_file" && ! -L "$config_file" ]]; then
  install -m644 "$app_dir/config.example.jsonc" "$config_file"
fi

if [[ "${1:-}" == "launcher" ]]; then
  shift
  action="${1:-open}"
  case "$action" in
    open|close|toggle) ;;
    *)
      printf 'quickdash: unknown launcher action: %s\n' "$action" >&2
      printf 'usage: quickdash launcher [open|close|toggle]\n' >&2
      exit 2
      ;;
  esac

  if /usr/bin/quickshell ipc --any-display -p "$app_dir" call launcher "$action" >/dev/null 2>&1; then
    exit 0
  fi

  /usr/bin/quickshell -p "$app_dir" --no-duplicate --daemonize

  for _ in $(seq 1 30); do
    if /usr/bin/quickshell ipc --any-display -p "$app_dir" call launcher "$action" >/dev/null 2>&1; then
      exit 0
    fi
    sleep 0.05
  done

  printf 'quickdash: failed to contact launcher IPC target\n' >&2
  exit 1
fi

exec /usr/bin/quickshell -p "$app_dir" "$@"
EOF

  install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/applications/quickdash.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=QuickDash
Comment=Configurable Wayland dashboard
Exec=quickdash --no-duplicate
TryExec=quickdash
Icon=quickdash
Terminal=false
Categories=Utility;
Keywords=dashboard;launcher;wayland;hyprland;quickshell;system;
StartupNotify=false
EOF

  install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/quickdash.svg" <<'EOF'
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64">
  <defs>
    <linearGradient id="bg" x1="8" y1="4" x2="56" y2="60" gradientUnits="userSpaceOnUse">
      <stop stop-color="#323d43"/>
      <stop offset="1" stop-color="#1e2326"/>
    </linearGradient>
  </defs>
  <rect x="4" y="4" width="56" height="56" rx="14" fill="url(#bg)"/>
  <rect x="12" y="12" width="10" height="40" rx="5" fill="#a7c080"/>
  <rect x="28" y="12" width="24" height="17" rx="5" fill="#4f585e"/>
  <rect x="28" y="35" width="24" height="17" rx="5" fill="#3a454a"/>
  <circle cx="40" cy="20.5" r="4" fill="#dbbc7f"/>
  <path d="M35 44h10" stroke="#83c092" stroke-width="4" stroke-linecap="round"/>
</svg>
EOF
}
