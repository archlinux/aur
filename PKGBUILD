# Maintainer: Arthur Simão <arthursimao312@gmail.com>
pkgname=gambiarra-infinite-bin
pkgver=1.0.2
pkgrel=2
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

# The GambiarraInfinite CLI is a Bun standalone executable (a fork of the
# OpenCode v2 CLI with the Gambiarra additions baked in): the whole /_larpcode/*
# API — GambiarraAPI Marketplace, jailbreaks, images, free-route, Tor — plus the
# `serve --service` background service the desktop app spawns.
#
# It is *not* the stock upstream CLI: that one has no /_larpcode routes, so the
# Marketplace POST hits the SPA fallback and returns HTTP 405.
#
# The version string is what the CLI reports on /api/info; the desktop app reads
# opencode-cli.version and only reuses the background service when the two match.
_cliver=0.0.0-local-202611241429
_cliasset=gambiarra-infinite-cli-linux-x64.zst

source=(
  "LICENSE::${url}/raw/v${pkgver}/LICENSE"
  "gambiarra-infinite-desktop-${pkgver}.tar.zst::${url}/releases/download/v${pkgver}/gambiarra-infinite-desktop-${pkgver}.tar.zst"
  "${_cliasset}::${url}/releases/download/v${pkgver}/${_cliasset}"
  "main.mjs"
)
# The CLI asset is a raw single-file zstd stream, not a tarball: skip makepkg's
# auto-extraction and unpack it by hand in package().
noextract=("${_cliasset}")
makedepends=('zstd')
# LICENSE
sha256sums=('SKIP'
            'fc5640965ef6693b9dadd39f7c579856966e5c8922f25ecbd78cd902c7e83b22'
            '99100fb333ed214250754f8bec9e7e3de97201c8e255f2782cb3a93dac540148'
            '8891bc8930d3f1aba8a0a464f53f52cc89c672c0d37c8a699287d5b1d15f70d5')

package() {
  local _appdir="${pkgdir}/usr/lib/gambiarra-infinite"
  install -d "${_appdir}"

  # --- desktop payload (Electron bundles + runtime node_modules) ---
  [ -d "${srcdir}/desktop-pkg" ] || \
    bsdtar -xf "${srcdir}/gambiarra-infinite-desktop-${pkgver}.tar.zst" -C "${srcdir}"
  cp -r "${srcdir}/desktop-pkg/out" "${srcdir}/desktop-pkg/node_modules" "${_appdir}/"
  install -Dm644 "${srcdir}/desktop-pkg/package.json" "${_appdir}/package.json"

  # --- GambiarraInfinite CLI replaces the bundled Windows opencode-cli.exe ---
  # Raw zstd stream -> executable, then record the version it reports on /api/info
  # so the desktop app recognises the background service it starts.
  # makepkg links sources into $srcdir and zstd refuses to read symlinks, so
  # resolve the real path first.
  zstd -dc -- "$(readlink -f "${srcdir}/${_cliasset}")" > "${_appdir}/opencode-cli"
  chmod 755 "${_appdir}/opencode-cli"
  printf '%s' "${_cliver}" > "${_appdir}/opencode-cli.version"

  # --- icons + AppStream metadata (flattened next to the app dir) ---
  cp -r "${srcdir}/desktop-pkg/resources/icons" "${_appdir}/icons"
  install -Dm644 "${srcdir}/desktop-pkg/resources/ai.larpcode.desktop.dev.metainfo.xml" \
    "${pkgdir}/usr/share/metainfo/ai.larpcode.desktop.dev.metainfo.xml"

  # --- shim: point process.resourcesPath at the app dir, then load the bundle ---
  # Shipped from the AUR repo (not the payload) so shim fixes do not require
  # re-uploading the desktop tarball.
  install -Dm644 "${srcdir}/main.mjs" "${_appdir}/main.mjs"
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
exec electron44 --class=gambiarra-infinite "${flags[@]}" "$APPDIR" "$@"
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
StartupWMClass=gambiarra-infinite
EOF

  # --- icons ---
  install -Dm644 "${srcdir}/desktop-pkg/resources/icons/32x32.png"      "${pkgdir}/usr/share/icons/hicolor/32x32/apps/gambiarra-infinite.png"
  install -Dm644 "${srcdir}/desktop-pkg/resources/icons/64x64.png"      "${pkgdir}/usr/share/icons/hicolor/64x64/apps/gambiarra-infinite.png"
  install -Dm644 "${srcdir}/desktop-pkg/resources/icons/128x128.png"    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/gambiarra-infinite.png"
  install -Dm644 "${srcdir}/desktop-pkg/resources/icons/128x128@2x.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/gambiarra-infinite.png"
  install -Dm644 "${srcdir}/desktop-pkg/resources/icons/icon.png"       "${pkgdir}/usr/share/icons/hicolor/512x512/apps/gambiarra-infinite.png"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
