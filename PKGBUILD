# Maintainer: maria-rcks <maria@kuuro.net>

pkgname=codex-desktop-bin
pkgver=26.224.1209
pkgrel=1
pkgdesc='OpenAI Codex Desktop (repacked from macOS DMG for Linux)'
arch=('x86_64')
_electron_pkg='electron40-bin'
_electron_bin='/usr/bin/electron40'
url='https://openai.com/codex'
license=('custom')
depends=(
  "$_electron_pkg"
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'gcc-libs'
  'glib2'
  'gtk3'
  'libdrm'
  'libnotify'
  'libx11'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxshmfence'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'openai-codex-bin'
)
makedepends=('node-gyp' 'p7zip' 'python')
provides=('codex-desktop')
conflicts=('codex-desktop')
options=('!strip')

source=(
  'Codex.dmg::https://persistent.oaistatic.com/codex-app-prod/Codex.dmg'
  'node-pty-1.1.0.tgz::https://registry.npmjs.org/node-pty/-/node-pty-1.1.0.tgz'
  'better-sqlite3-12.4.6.tgz::https://registry.npmjs.org/better-sqlite3/-/better-sqlite3-12.4.6.tgz'
  'node-addon-api-7.1.1.tgz::https://registry.npmjs.org/node-addon-api/-/node-addon-api-7.1.1.tgz'
  'node-addon-api-8.5.0.tgz::https://registry.npmjs.org/node-addon-api/-/node-addon-api-8.5.0.tgz'
  'codex-icon.png'
)
sha256sums=(
  'SKIP'
  'c7517f19083ddcb05f276904680eb2b11a6b5ecab778b8e4e5685a6d645b3f60'
  '83b436290c62e8d9d95b2df0f74cbfde59e8578449d414d936dc3be1194137ce'
  'b10455d15a977c0cd17a1cb0eb679e03d939f8ef8d4302eb33e1f78dacc71f82'
  'd12f07c8162283b6213551855f1da8dac162331374629830b5e640f130f07910'
  'f33042b1a549fdc2c82b20e8eefa1fd5ac9f93147af40389c4773aaf48d097a7'
)
prepare() {
  cd "$srcdir"

  local codex_dmg_dir="$srcdir/codex-dmg"
  local codex_resources="$codex_dmg_dir/Codex Installer/Codex.app/Contents/Resources"

  if [[ ! -f "$codex_resources/app.asar" ]]; then
    rm -rf "$codex_dmg_dir"
    7z x -y Codex.dmg -o"$codex_dmg_dir" >/dev/null
  fi

  rm -rf "$srcdir/codex-app"
  install -Dm644 "$codex_resources/app.asar" "$srcdir/codex-app/resources/app.asar"
  cp -a "$codex_resources/app.asar.unpacked" "$srcdir/codex-app/resources/"

  # Hide menu bar by default, but keep Alt behavior (autoHideMenuBar).
  # Best-effort only: if upstream bundle changes, skip patching instead of failing.
  local asar_path="$srcdir/codex-app/resources/app.asar"
  local patched_menu_bar=0

  # Auto-revert a previously hard-applied removeMenu() patch if present.
  local hard_old='S.removeMenu()'
  local hard_new='S.on("show",N)'
  local hard_old_hits hard_new_hits hard_off

  hard_old_hits=$(LC_ALL=C grep -aobF -- "$hard_old" "$asar_path" | wc -l)
  hard_new_hits=$(LC_ALL=C grep -aobF -- "$hard_new" "$asar_path" | wc -l)

  if [[ "$hard_old_hits" -eq 1 && "$hard_new_hits" -eq 0 ]]; then
    hard_off=$(LC_ALL=C grep -aobF -- "$hard_old" "$asar_path" | cut -d: -f1)
    printf '%s' "$hard_new" | dd of="$asar_path" bs=1 seek="$hard_off" conv=notrunc status=none
    echo "Reverted legacy hard menu patch anchor: $hard_old"
  elif [[ "$hard_old_hits" -gt 1 ]]; then
    echo "WARNING: Unexpected removeMenu() anchor count for '$hard_old': $hard_old_hits (skipping revert)" >&2
  fi

  local old new old_hits new_hits patch_off
  for old in \
    'S.isDestroyed()||S.setTitle(S.getTitle())' \
    'E.isDestroyed()||E.setTitle(E.getTitle())'
  do
    if [[ "$old" == S* ]]; then
      new='S.isDestroyed()||S.setAutoHideMenuBar(!0)'
    else
      new='E.isDestroyed()||E.setAutoHideMenuBar(!0)'
    fi

    if [[ ${#old} -ne ${#new} ]]; then
      echo "WARNING: Menu-bar replacement size mismatch for '$old' -> '$new' (skipping)" >&2
      continue
    fi

    old_hits=$(LC_ALL=C grep -aobF -- "$old" "$asar_path" | wc -l)
    new_hits=$(LC_ALL=C grep -aobF -- "$new" "$asar_path" | wc -l)

    if [[ "$old_hits" -eq 1 ]]; then
      patch_off=$(LC_ALL=C grep -aobF -- "$old" "$asar_path" | cut -d: -f1)
      printf '%s' "$new" | dd of="$asar_path" bs=1 seek="$patch_off" conv=notrunc status=none
      echo "Patched app.asar: enabled autoHideMenuBar ($old -> $new)"
      patched_menu_bar=1
      break
    elif [[ "$old_hits" -eq 0 && "$new_hits" -eq 1 ]]; then
      echo "app.asar already patched: autoHideMenuBar enabled"
      patched_menu_bar=1
      break
    elif [[ "$old_hits" -gt 1 ]]; then
      echo "WARNING: Expected one menu-bar patch anchor for '$old', found $old_hits (skipping)" >&2
    fi
  done

  if [[ "$patched_menu_bar" -eq 0 ]]; then
    echo "WARNING: Menu-bar patch anchor not found; skipping patch (upstream bundle likely changed)" >&2
  fi

  if [[ ! -f "$srcdir/nodepty-src/package.json" ]]; then
    rm -rf "$srcdir/nodepty-src"
    mkdir -p "$srcdir/nodepty-src"
    bsdtar -xf "$srcdir/node-pty-1.1.0.tgz" -C "$srcdir/nodepty-src" --strip-components=1
    mkdir -p "$srcdir/nodepty-src/node_modules/node-addon-api"
    bsdtar -xf "$srcdir/node-addon-api-7.1.1.tgz" -C "$srcdir/nodepty-src/node_modules/node-addon-api" --strip-components=1
  fi

  if [[ ! -f "$srcdir/bsql-src/package.json" ]]; then
    rm -rf "$srcdir/bsql-src"
    mkdir -p "$srcdir/bsql-src"
    bsdtar -xf "$srcdir/better-sqlite3-12.4.6.tgz" -C "$srcdir/bsql-src" --strip-components=1
    mkdir -p "$srcdir/bsql-src/node_modules/node-addon-api"
    bsdtar -xf "$srcdir/node-addon-api-8.5.0.tgz" -C "$srcdir/bsql-src/node_modules/node-addon-api" --strip-components=1
  fi
}

build() {
  local gyp_cmd=(node-gyp)
  local electron_target
  electron_target="$($_electron_bin --version 2>/dev/null | sed 's/^v//')"
  [[ -z "$electron_target" ]] && electron_target="${CODEX_ELECTRON_TARGET:-}"
  if [[ -z "$electron_target" ]]; then
    echo "ERROR: Failed to resolve Electron target from $_electron_bin or CODEX_ELECTRON_TARGET" >&2
    echo "Install $_electron_pkg or set CODEX_ELECTRON_TARGET (for CI/non-local builds)." >&2
    return 1
  fi

  local gyp_env=(
    PYTHON="${PYTHON:-/usr/bin/python3}"
    npm_config_runtime=electron
    npm_config_target="$electron_target"
    npm_config_disturl=https://electronjs.org/headers
    npm_config_build_from_source=true
  )
  local expected_stamp
  local cache_root
  local cache_key
  local cache_dir
  local key_file="$srcdir/.native-build.key"
  local nodepty_out="$srcdir/nodepty-src/build/Release/pty.node"
  local bsql_out="$srcdir/bsql-src/build/Release/better_sqlite3.node"

  expected_stamp="$(
    printf '%s\n' \
      "electron=$electron_target" \
      "node-pty=$(sha256sum "$srcdir/node-pty-1.1.0.tgz" | awk '{print $1}')" \
      "better-sqlite3=$(sha256sum "$srcdir/better-sqlite3-12.4.6.tgz" | awk '{print $1}')" \
      "node-addon-api-pty=$(sha256sum "$srcdir/node-addon-api-7.1.1.tgz" | awk '{print $1}')" \
      "node-addon-api-bsql=$(sha256sum "$srcdir/node-addon-api-8.5.0.tgz" | awk '{print $1}')"
  )"

  cache_root="${CODEX_NATIVE_CACHE_DIR:-$startdir/.native-addon-cache}"
  cache_key="$(printf '%s\n%s' "${CARCH:-x86_64}" "$expected_stamp" | sha256sum | awk '{print $1}')"
  cache_dir="$cache_root/$cache_key"

  local need_nodepty=1
  local need_bsql=1
  if [[ -f "$key_file" && "$(cat "$key_file")" == "$cache_key" ]]; then
    [[ -f "$nodepty_out" ]] && need_nodepty=0
    [[ -f "$bsql_out" ]] && need_bsql=0
  fi

  if (( need_nodepty == 1 )) && [[ -f "$cache_dir/pty.node" ]]; then
    install -Dm755 "$cache_dir/pty.node" "$nodepty_out"
    need_nodepty=0
  fi

  if (( need_bsql == 1 )) && [[ -f "$cache_dir/better_sqlite3.node" ]]; then
    install -Dm755 "$cache_dir/better_sqlite3.node" "$bsql_out"
    need_bsql=0
  fi

  if (( need_nodepty == 0 && need_bsql == 0 )); then
    echo "Using cached native addon builds"
    printf '%s' "$cache_key" > "$key_file"
    return 0
  fi

  if (( need_nodepty == 1 )); then
    cd "$srcdir/nodepty-src"
    env "${gyp_env[@]}" "${gyp_cmd[@]}" rebuild -j max
  fi

  if (( need_bsql == 1 )); then
    cd "$srcdir/bsql-src"
    env "${gyp_env[@]}" "${gyp_cmd[@]}" rebuild -j max
  fi

  mkdir -p "$cache_dir"
  install -Dm755 "$nodepty_out" "$cache_dir/pty.node"
  install -Dm755 "$bsql_out" "$cache_dir/better_sqlite3.node"
  printf '%s' "$cache_key" > "$key_file"
}

package() {
  cd "$srcdir"

  install -d "$pkgdir/opt/$pkgname"
  cp -a codex-app/resources "$pkgdir/opt/$pkgname/"

  # Electron runtime is provided by electron40-bin.
  install -Dm644 /dev/stdin "$pkgdir/opt/$pkgname/package.json" << 'EOF'
{
  "name": "codex-desktop-bin",
  "version": "26.224.1209",
  "main": "resources/app.asar"
}
EOF

  install -Dm755 "$srcdir/nodepty-src/build/Release/pty.node" \
    "$pkgdir/opt/$pkgname/resources/app.asar.unpacked/node_modules/node-pty/build/Release/pty.node"
  install -Dm755 "$srcdir/bsql-src/build/Release/better_sqlite3.node" \
    "$pkgdir/opt/$pkgname/resources/app.asar.unpacked/node_modules/better-sqlite3/build/Release/better_sqlite3.node"

  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/codex-desktop" << 'EOF'
#!/usr/bin/env bash

export ELECTRON_FORCE_IS_PACKAGED=1

# Prefer the codex CLI from openai-codex-bin if available.
if [[ -z "${CODEX_CLI_PATH-}" ]] && command -v codex >/dev/null 2>&1; then
  export CODEX_CLI_PATH="$(command -v codex)"
fi

extra_flags=()
if [[ -n "${WAYLAND_DISPLAY-}" || "${XDG_SESSION_TYPE-}" == "wayland" ]]; then
  extra_flags+=(--enable-features=UseOzonePlatform --ozone-platform=wayland --ozone-platform-hint=wayland)
else
  extra_flags+=(--ozone-platform-hint=auto)
fi

exec /usr/bin/electron40 "${extra_flags[@]}" /opt/codex-desktop-bin/resources/app.asar "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/codex-desktop"

  install -Dm644 "$srcdir/codex-icon.png" "$pkgdir/usr/share/pixmaps/codex-desktop.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/codex-desktop.desktop" << 'EOF'
[Desktop Entry]
Name=Codex
Comment=OpenAI Codex Desktop
Exec=codex-desktop %U
Terminal=false
Type=Application
Icon=/usr/share/pixmaps/codex-desktop.png
StartupWMClass=Codex
Categories=Development;
MimeType=x-scheme-handler/codex;
EOF

  install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE" << 'EOF'
Codex Desktop is proprietary software by OpenAI.
See the upstream terms for usage and distribution rights.
EOF
}
