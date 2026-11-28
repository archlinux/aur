# Maintainer: Arthur Simão <arthursimao312@gmail.com>
pkgname=gambiarra-infinite-bin
pkgver=4.3.0
pkgrel=1
pkgdesc="GambiarraInfinite V4 - AI coding desktop app (LarpCode/OpenCode rebrand)"
arch=('x86_64')
url="https://github.com/ArthurSimin/GambiarraInfinite"
license=('MIT')
depends=('electron44' 'ripgrep')
optdepends=('libappindicator-gtk3: tray icon support')
provides=('gambiarra-infinite')
conflicts=('gambiarra-infinite')
install=gambiarra-infinite.install
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
_cliver=4.3.0
_cliasset=gambiarra-infinite-cli-linux-x64.zst

source=(
  "LICENSE::${url}/raw/v${pkgver}/LICENSE"
  "gambiarra-infinite-desktop-${pkgver}.tar.zst::${url}/releases/download/v${pkgver}/gambiarra-infinite-desktop-${pkgver}.tar.zst"
  "${_cliasset}::${url}/releases/download/v${pkgver}/${_cliasset}"
  "main.mjs"
  "warp-install.sh"
)
# The CLI asset is a raw single-file zstd stream, not a tarball: skip makepkg's
# auto-extraction and unpack it by hand in package().
noextract=("${_cliasset}")
makedepends=('zstd')
# LICENSE
sha256sums=('SKIP'
            '4cfe65103f770fc3e0717ce2e611ee75feefb0e3c5b0a10985fe9a437003e91f'
            'b28c4ca161224e5245ab8eeeaf66ae58552e7cd1d56138b1d82938f48f8fce1f'
            'bff20d5bda7f4d022aa4e1700115891932125fe66da40650f5964d71f286ffd5'
            'e148e36d4c71598747c32bcb9b54fc7ae9e478fce1d6efba03ec9513bdaf42da')

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

  # --- native Cloudflare WARP installer (the notice's install button) ---
  # Also shipped from the AUR repo so installer fixes do not require a new
  # payload. It must sit next to the CLI: the CLI runs it relative to its own
  # executable, and main.mjs symlinks it into the staged CLI directory.
  install -Dm755 "${srcdir}/warp-install.sh" "${_appdir}/warp-install.sh"

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
