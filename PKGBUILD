# Maintainer: Your Name <your@email.com>
# Contributor: OpenChatCut Contributors
#
# OpenChatCut — Local-first conversational AI video editor
#   https://github.com/0xsline/OpenChatCut
#
# This PKGBUILD uses system Electron (electron-builder is build-only) and
# system Chromium (for Remotion headless rendering) plus system FFmpeg.
# The Remotion serve bundle is prebuilt at package time for fast startup.
#
# ── Building locally ──────────────────────────────────────────────────────
#   cd /tmp
#   git clone https://github.com/0xsline/OpenChatCut.git openchatcut
#   cd openchatcut
#   makepkg -si
#
# ── AUR submission notes ──────────────────────────────────────────────────
# Replace 'Your Name' and email above with the AUR maintainer info.
# Run `namcap PKGBUILD` and `namcap openchatcut-*.pkg.tar.zst` for QA.

pkgname=openchatcut
pkgver=0.1.1
pkgrel=1
pkgdesc="Local-first conversational AI video editor with multi-track timeline, Agent Skills, MCP integration, and Remotion-powered rendering"
arch=('x86_64')
url="https://github.com/0xsline/OpenChatCut"
license=('AGPL3')
depends=(
  'electron>=30'
  'nodejs>=24'
  'npm'
  'chromium'
  'ffmpeg'
  'fontconfig'
)
makedepends=(
  'git'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/0xsline/OpenChatCut/archive/refs/tags/v$pkgver.tar.gz"
        'electron43-isPackaged.patch')
sha256sums=('dc44414523f118ee9c07a41854843893075981a0c84fa04d72ed21f2c3722711'
            'SKIP')
# v0.1.1 annotated tag → commit ab07f81a21bb33700cb4c4a71ff0b2387fb9e625
# GitHub archive handles annotated tags correctly.

prepare() {
  cd "$srcdir"

  # GitHub archive tag extracts to OpenChatCut-<ver> (capitalized)
  if [ -d "OpenChatCut-${pkgver}" ] && [ ! -d "${pkgname}-${pkgver}" ]; then
    mv "OpenChatCut-${pkgver}" "${pkgname}-${pkgver}"
  fi

  cd "${pkgname}-${pkgver}"

  # The lockfile ships with npmmirror.com mirrors. npm 12+ refuses to fetch
  # lockfile URLs outside the configured registry. Rewrite to canonical npmjs.org.
  sed -i 's|https://registry.npmmirror.com/|https://registry.npmjs.org/|g' package-lock.json

  # .nvmrc is for dev; ensure it matches our nodejs dep range
  echo '24' > .nvmrc

  # Arch Electron compat: Arch's electron43 forces app.isPackaged=true,
  # which breaks path resolution. Patch to always use import.meta.url.
  patch -Np1 < "$srcdir/electron43-isPackaged.patch"
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  # ── npm install ─────────────────────────────────────────────────────────
  # npm 12 blocks install scripts by default. We'll run the essential ones
  # manually afterward.
  npm install --registry https://registry.npmjs.org

  # Manually run essential install scripts that npm 12 blocked
  # esbuild — needed for building the Electron main process
  node node_modules/esbuild/install.js 2>/dev/null || true
  # @ffprobe-installer — make ffprobe executable
  chmod 755 node_modules/@ffprobe-installer/linux-x64/ffprobe 2>/dev/null || true

  # ── TypeScript check + Vite build (web app) ─────────────────────────────
  npm run build

  # ── Electron main process (esbuild) ─────────────────────────────────────
  npm run desktop:build:main

  # ── Remotion serve bundle (avoid on-demand webpack at runtime) ──────────
  npx tsx desktop/prebuild-remotion.mts

  # ── Remove devDependencies (electron, typescript, vite, etc.) ───────────
  # Saves ~165 MB
  npm prune --production
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  local _libdir="/usr/lib/${pkgname}"

  install -dm755 "${pkgdir}${_libdir}"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/pixmaps"

  # ── App code ────────────────────────────────────────────────────────────
  cp -r dist                   "${pkgdir}${_libdir}/dist"
  cp -r desktop-dist           "${pkgdir}${_libdir}/desktop-dist"
  cp -r server                 "${pkgdir}${_libdir}/server"
  cp -r shared                 "${pkgdir}${_libdir}/shared"
  cp -r remotion               "${pkgdir}${_libdir}/remotion"
  cp -r assets                 "${pkgdir}${_libdir}/assets"
  cp -r public                 "${pkgdir}${_libdir}/public"
  cp -r src                    "${pkgdir}${_libdir}/src"

  # ── npm dependencies (pruned: production only) ──────────────────────────
  cp -r node_modules           "${pkgdir}${_libdir}/node_modules"

  # ── Config / metadata ───────────────────────────────────────────────────
  cp package.json               "${pkgdir}${_libdir}/"
  cp package-lock.json          "${pkgdir}${_libdir}/"
  cp vite.config.ts             "${pkgdir}${_libdir}/"
  cp tsconfig.json              "${pkgdir}${_libdir}/"
  cp tsconfig.app.json          "${pkgdir}${_libdir}/"
  cp tsconfig.node.json         "${pkgdir}${_libdir}/"
  cp electron-builder.config.mjs "${pkgdir}${_libdir}/"
  cp index.html                 "${pkgdir}${_libdir}/"
  cp .env.example               "${pkgdir}${_libdir}/"

  # Fix permissions: node_modules/.bin contains launcher scripts
  find "${pkgdir}${_libdir}/node_modules/.bin" -type f -exec chmod 755 {} + 2>/dev/null || true

  # ── Wrapper script ──────────────────────────────────────────────────────
  cat >"${pkgdir}/usr/bin/${pkgname}" <<'WRAPPER'
#!/bin/bash
# OpenChatCut — Arch launcher
# chdirs to XDG config dir, links system binaries, launches via system Electron.

set -euo pipefail

CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/openchatcut"
LIB_DIR="/usr/lib/openchatcut"

mkdir -p "$CONFIG_DIR"

# First-run: copy .env.example → .env.local if no config exists
ENV_LOCAL="$CONFIG_DIR/.env.local"
if [ ! -f "$ENV_LOCAL" ]; then
  if [ -f "$LIB_DIR/.env.example" ]; then
    cp "$LIB_DIR/.env.example" "$ENV_LOCAL"
    echo "OpenChatCut: created default config at $ENV_LOCAL"
    echo "  → Edit it to add your LLM / media-service API keys."
  fi
fi

# Speed up Remotion rendering: use prebuilt serve bundle (avoids on-demand webpack)
export CC_REMOTION_BUNDLE="$LIB_DIR/desktop-dist/remotion-bundle"

# Let Remotion find system Chromium for headless rendering
export REMOTION_BROWSER_EXECUTABLE="/usr/bin/chromium"

# Use system FFmpeg/FFprobe (not the bundled static binaries)
export FFMPEG_PATH="/usr/bin/ffmpeg"
export FFPROBE_PATH="/usr/bin/ffprobe"

cd "$CONFIG_DIR"
exec /usr/bin/electron --user-data-dir="$CONFIG_DIR" "$LIB_DIR/desktop-dist/main.mjs" "$@"
WRAPPER
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"

  # ── Desktop entry ──────────────────────────────────────────────────────
  cat >"${pkgdir}/usr/share/applications/${pkgname}.desktop" <<DESKTOP
[Desktop Entry]
Name=OpenChatCut
Comment=Local-first conversational AI video editor
Exec=${pkgname}
Icon=${pkgname}
Type=Application
Categories=AudioVideo;Video;Editor;
Terminal=false
StartupWMClass=OpenChatCut
MimeType=application/x-openchatcut-project;
DESKTOP

  # ── Icon ────────────────────────────────────────────────────────────────
  install -Dm644 public/openchatcut-icon.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
