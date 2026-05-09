# Maintainer: Nathanael Bonfim <dev@nathabonfim59.com>

pkgname=dpcode-bin
pkgver=0.0.43
pkgrel=1
pkgdesc='DP Code desktop app packaged from the upstream AppImage'
arch=('x86_64')
_upstream_tag='v0.0.43'
_upstream_version='0.0.43'
_appimage_name="DP-Code-${_upstream_version}-x86_64.AppImage"
url='https://dpcode.cc'
license=('MIT')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libdrm'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'xdg-utils'
  'zlib'
)
optdepends=(
  'openai-codex: use the system-installed Codex CLI'
  'sqlite: repair imported T3 Code state with dpcode-repair-t3-import'
)
provides=("dpcode=${pkgver}")
conflicts=('dpcode')
options=('!debug' '!emptydirs' '!strip')
source=(
  "${_appimage_name}::https://github.com/Emanuele-web04/dpcode/releases/download/${_upstream_tag}/${_appimage_name}"
  'dpcode-icon.png'
  'LICENSE'
)
sha256sums=(
  '86221a29a9a041a6c1cf858f78414c5ca8fdbecc9e308b089b9ea286a6a64edd'
  '9fada842a88c3b1a503ee45756f781b7d32b39cc97579f4f1e880bb28606e728'
  '935d8f2af0c703f9c39517ee57cc4930b19d02d533be930b63f0e82f93614b43'
)

prepare() {
  chmod +x "$srcdir/$_appimage_name"
  rm -rf "$srcdir/squashfs-root"
  "$srcdir/$_appimage_name" --appimage-extract >/dev/null

  if [[ ! -d "$srcdir/squashfs-root" ]]; then
    echo "Failed to extract AppImage payload." >&2
    return 1
  fi
}

package() {
  install -d "$pkgdir/opt/$pkgname"
  cp -a --no-preserve=ownership "$srcdir/squashfs-root/." "$pkgdir/opt/$pkgname/"

  chmod -R a+rX "$pkgdir/opt/$pkgname"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/dpcode" << 'EOF'
#!/usr/bin/env bash
set -euo pipefail

appdir='/opt/dpcode-bin'
export APPDIR="$appdir"

if [[ -z "${CODEX_CLI_PATH-}" ]] && command -v codex >/dev/null 2>&1; then
  export CODEX_CLI_PATH="$(command -v codex)"
fi

if [[ "${DPCODE_IMPORT_T3-}" != "1" ]]; then
  dpcode_home="${DPCODE_HOME:-$HOME/.dpcode}"
  marker_dir="$dpcode_home/userdata/migrations"
  marker_path="$marker_dir/import-from-t3-v1.json"
  if [[ ! -e "$marker_path" ]]; then
    mkdir -p "$marker_dir"
    cat > "$marker_path" << MARKER
{
  "status": "completed",
  "sourceBaseDir": "$HOME/.t3",
  "targetBaseDir": "$dpcode_home",
  "sourceStateDir": "$HOME/.t3/userdata",
  "targetStateDir": "$dpcode_home/userdata",
  "importedArtifacts": [],
  "startedAt": "$(date --iso-8601=seconds)",
  "migratedAt": "$(date --iso-8601=seconds)",
  "notes": [
    "T3 Code state import was skipped by the Arch Linux dpcode-bin launcher because DP Code has diverged from T3 Code and T3 Code state can contain schema shapes that crash the DP Code backend. Set DPCODE_IMPORT_T3=1 before first launch to allow import."
  ]
}
MARKER
  fi
fi

export PATH="$appdir:$appdir/usr/bin:$appdir/usr/sbin:$PATH"
export XDG_DATA_DIRS="$appdir/usr/share:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"
if [[ -d "$appdir/usr/share/glib-2.0/schemas" ]]; then
  export GSETTINGS_SCHEMA_DIR="$appdir/usr/share/glib-2.0/schemas${GSETTINGS_SCHEMA_DIR:+:$GSETTINGS_SCHEMA_DIR}"
fi

# Chromium/Electron tries to register a hard-coded
# app-org.chromium.Chromium-$pid.scope with systemd. In some sessions that
# scope already exists, causing a noisy StartTransientUnit failure before the
# app starts. This environment variable makes Chromium skip that optional
# registration path.
export FLATPAK_SANDBOX_DIR="${FLATPAK_SANDBOX_DIR:-/run/host}"

extra_flags=(
  --disable-vulkan
  --disable-features=Vulkan,DefaultANGLEVulkan,VulkanFromANGLE
)
if [[ "${DPCODE_DISABLE_GPU-}" == "1" ]]; then
  extra_flags+=(--disable-gpu --disable-gpu-compositing)
fi
if [[ "${DPCODE_USE_WAYLAND-}" == "1" && ( -n "${WAYLAND_DISPLAY-}" || "${XDG_SESSION_TYPE-}" == "wayland" ) ]]; then
  extra_flags+=(--enable-features=UseOzonePlatform --ozone-platform=wayland --ozone-platform-hint=wayland)
elif [[ -n "${DISPLAY-}" ]]; then
  export GDK_BACKEND=x11
  unset WAYLAND_DISPLAY
  extra_flags+=(--ozone-platform=x11 --ozone-platform-hint=x11)
else
  extra_flags+=(--ozone-platform-hint=auto)
fi

exec "$appdir/dpcode" --no-sandbox "${extra_flags[@]}" "$@"
EOF

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/dpcode-skip-t3-import" << 'EOF'
#!/usr/bin/env bash
set -euo pipefail

dpcode_home="${DPCODE_HOME:-$HOME/.dpcode}"
marker_dir="$dpcode_home/userdata/migrations"
marker_path="$marker_dir/import-from-t3-v1.json"

if [[ -e "$marker_path" ]]; then
  echo "T3 import marker already exists: $marker_path"
  exit 0
fi

mkdir -p "$marker_dir"
now="$(date --iso-8601=seconds)"
cat > "$marker_path" << MARKER
{
  "status": "completed",
  "sourceBaseDir": "$HOME/.t3",
  "targetBaseDir": "$dpcode_home",
  "sourceStateDir": "$HOME/.t3/userdata",
  "targetStateDir": "$dpcode_home/userdata",
  "importedArtifacts": [],
  "startedAt": "$now",
  "migratedAt": "$now",
  "notes": [
    "T3 Code state import was skipped by dpcode-skip-t3-import because DP Code has diverged from T3 Code and T3 Code state can contain schema shapes that crash the DP Code backend."
  ]
}
MARKER

echo "Created T3 import skip marker: $marker_path"
EOF

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/dpcode-repair-t3-import" << 'EOF'
#!/usr/bin/env bash
set -euo pipefail

db="${DPCODE_STATE_DB:-${XDG_STATE_HOME:-$HOME/.dpcode}/userdata/state.sqlite}"

if [[ ! -f "$db" ]]; then
  echo "DP Code state database not found: $db" >&2
  echo "Run dpcode once to let it import T3 Code state, then run this helper again." >&2
  exit 1
fi

if ! command -v sqlite3 >/dev/null 2>&1; then
  echo "sqlite3 is required. Install sqlite or run the SQL repair manually." >&2
  exit 1
fi

backup="${db}.bak-t3-import-$(date +%Y%m%d%H%M%S)"
cp -- "$db" "$backup"

sqlite3 "$db" <<'SQL'
UPDATE orchestration_events
SET payload_json = json_set(
  payload_json,
  '$.modelSelection.options',
  json_object('agent', json_extract(payload_json, '$.modelSelection.options[0].value'))
)
WHERE json_type(payload_json, '$.modelSelection.options') = 'array'
  AND json_extract(payload_json, '$.modelSelection.provider') = 'opencode'
  AND json_extract(payload_json, '$.modelSelection.options[0].id') = 'agent';

UPDATE projection_threads
SET model_selection_json = json_set(
  model_selection_json,
  '$.options',
  json_object('agent', json_extract(model_selection_json, '$.options[0].value'))
)
WHERE json_type(model_selection_json, '$.options') = 'array'
  AND json_extract(model_selection_json, '$.provider') = 'opencode'
  AND json_extract(model_selection_json, '$.options[0].id') = 'agent';

UPDATE projection_projects
SET default_model_selection_json = json_set(
  default_model_selection_json,
  '$.options',
  json_object('agent', json_extract(default_model_selection_json, '$.options[0].value'))
)
WHERE json_type(default_model_selection_json, '$.options') = 'array'
  AND json_extract(default_model_selection_json, '$.provider') = 'opencode'
  AND json_extract(default_model_selection_json, '$.options[0].id') = 'agent';
SQL

remaining="$(sqlite3 "$db" <<'SQL'
SELECT
  (SELECT count(*) FROM orchestration_events WHERE json_type(payload_json, '$.modelSelection.options') = 'array') +
  (SELECT count(*) FROM projection_threads WHERE json_type(model_selection_json, '$.options') = 'array') +
  (SELECT count(*) FROM projection_projects WHERE json_type(default_model_selection_json, '$.options') = 'array');
SQL
)"

echo "Backed up database to: $backup"
if [[ "$remaining" == "0" ]]; then
  echo "T3 import repair complete."
else
  echo "T3 import repair complete, but $remaining array-shaped model option rows remain." >&2
  echo "Those rows may use a shape this helper does not recognize." >&2
  exit 2
fi
EOF

  install -Dm644 "$srcdir/dpcode-icon.png" \
    "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/dpcode.png"
  install -Dm644 "$srcdir/dpcode-icon.png" \
    "$pkgdir/usr/share/pixmaps/dpcode.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/dpcode.desktop" << 'EOF'
[Desktop Entry]
Name=DP Code
Comment=DP Code desktop build
Exec=dpcode %U
Terminal=false
Type=Application
Icon=dpcode
StartupWMClass=dpcode
Categories=Development;
EOF

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
