# Maintainer: Arthur Simão <arthursimao312@gmail.com>
pkgname=gambiarra-infinite-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="GambiarraInfinite V4 - AI coding desktop app (LarpCode/OpenCode rebrand)"
arch=('x86_64')
url="https://github.com/ArthurSimin/GambiarraInfinite"
license=('MIT')
depends=('electron44' 'ripgrep')
optdepends=('libappindicator-gtk3: tray icon support')
provides=('gambiarra-infinite')
conflicts=('gambiarra-infinite')
# opencode-cli is a Bun standalone executable: stripping discards the embedded
# bundle and leaves a bare runtime that no longer knows the `serve` command.
options=('!strip' '!debug')

# Pinned OpenCode v2 CLI (Bun standalone, x86_64 baseline so it runs everywhere).
# The desktop app spawns it as `opencode serve --service`; a v1 CLI does not
# understand --service and exits 1.
_cliver=2.4.1

source=(
  "LICENSE::${url}/raw/v${pkgver}/LICENSE"
  "gambiarra-infinite-desktop-${pkgver}.tar.zst::${url}/releases/download/v${pkgver}/gambiarra-infinite-desktop-${pkgver}.tar.zst"
  "cli-linux-x64-baseline-${_cliver}.tgz::https://registry.npmjs.org/@opencode/cli-linux-x64-baseline/-/cli-linux-x64-baseline-${_cliver}.tgz"
)
# LICENSE
sha256sums=('SKIP'
            'fc5640965ef6693b9dadd39f7c579856966e5c8922f25ecbd78cd902c7e83b22'
            'fd9714fb1a982f51f6185b5fb242706c31faf8b1d0cd633613df9156f565f7fa')

package() {
  local _appdir="${pkgdir}/usr/lib/gambiarra-infinite"
  install -d "${_appdir}"

  # --- desktop payload (Electron bundles + runtime node_modules) ---
  [ -d "${srcdir}/desktop-pkg" ] || \
    bsdtar -xf "${srcdir}/gambiarra-infinite-desktop-${pkgver}.tar.zst" -C "${srcdir}"
  cp -r "${srcdir}/desktop-pkg/out" "${srcdir}/desktop-pkg/node_modules" "${_appdir}/"
  install -Dm644 "${srcdir}/desktop-pkg/package.json" "${_appdir}/package.json"

  # --- Linux OpenCode v2 CLI replaces the bundled Windows opencode-cli.exe ---
  install -Dm755 "${srcdir}/package/bin/opencode" "${_appdir}/opencode-cli"
  printf '%s' "${_cliver}" > "${_appdir}/opencode-cli.version"

  # --- icons + AppStream metadata (flattened next to the app dir) ---
  cp -r "${srcdir}/desktop-pkg/resources/icons" "${_appdir}/icons"
  install -Dm644 "${srcdir}/desktop-pkg/resources/ai.larpcode.desktop.dev.metainfo.xml" \
    "${pkgdir}/usr/share/metainfo/ai.larpcode.desktop.dev.metainfo.xml"

  # --- shim: point process.resourcesPath at the app dir, then load the bundle ---
  install -Dm644 "${srcdir}/desktop-pkg/main.mjs" "${_appdir}/main.mjs"
  sed -i 's#"main": "./out/main/index.js"#"main": "./main.mjs"#' "${_appdir}/package.json"
  grep -q '"main": "./main.mjs"' "${_appdir}/package.json"

  # --- launcher ---
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/gambiarra-infinite" <<'EOF'
#!/bin/bash
APPDIR="${GAMBIARRA_APPDIR:-/usr/lib/gambiarra-infinite}"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
flags=()
if [[ -f "$XDG_CONFIG_HOME/gambiarra-infinite-flags.conf" ]]; then
  mapfile -t flags < <(grep -vE '^[[:space:]]*(#|$)' "$XDG_CONFIG_HOME/gambiarra-infinite-flags.conf")
fi
exec electron44 "${flags[@]}" "$APPDIR" "$@"
EOF

  # --- desktop entry ---
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/gambiarra-infinite.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=GambiarraInfinite V4
GenericName=AI Coding App
Comment=Write and run code with the AI model and provider you choose
Exec=gambiarra-infinite %U
Icon=gambiarra-infinite
Terminal=false
Categories=Development;IDE;TextEditor;
Keywords=ai;code;editor;opencode;
StartupNotify=true
StartupWMClass=GambiarraInfinite V4
EOF

  # --- icons ---
  install -Dm644 "${srcdir}/desktop-pkg/resources/icons/32x32.png"      "${pkgdir}/usr/share/icons/hicolor/32x32/apps/gambiarra-infinite.png"
  install -Dm644 "${srcdir}/desktop-pkg/resources/icons/64x64.png"      "${pkgdir}/usr/share/icons/hicolor/64x64/apps/gambiarra-infinite.png"
  install -Dm644 "${srcdir}/desktop-pkg/resources/icons/128x128.png"    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/gambiarra-infinite.png"
  install -Dm644 "${srcdir}/desktop-pkg/resources/icons/128x128@2x.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/gambiarra-infinite.png"
  install -Dm644 "${srcdir}/desktop-pkg/resources/icons/icon.png"       "${pkgdir}/usr/share/icons/hicolor/512x512/apps/gambiarra-infinite.png"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
