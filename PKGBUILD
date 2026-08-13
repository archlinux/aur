# Maintainer: Youcef <youcef.nafa@gmail.com>
# Co-maintainer: Evert <evorster at gmail dot com>
# This package uses a venv-based installation inspired by the official NousResearch install.sh. It swaps off uv with python311's venv since python 3.11 is the latest version supported by the developer. The venv solution allows the inclusion of all nodejs modules inside the package's /opt as opposed to shipping the package following ArchLinux convensions (/usr/share,/usr/lib,/usr/bin).
# Optional dependencies are dissociated from arch and need to be installed manually into venv. Although, many are installed by hermes lazyly when needed.
# TODO: there needs to be a way to copy skills upon hermes package update, or, at least, to prompt the user to do so.
#
# Optional build flags:
#   HERMES_BUILD_DESKTOP=1  Build the Electron desktop app (apps/desktop/) and ship it
#                           inside the package.  This adds a significant build time cost
#                           (Electron Chromium download + full TypeScript/Vite build) and
#                           increases the package size by ~200 MB.  Without this flag the
#                           desktop app is built on first run via 'hermes desktop'.
#   HERMES_PIP_EXTRAS=      Comma-separated list of pip extras to install beyond [all].
#                           Because the package installs to /opt (root-owned), upstream
#                           lazy-install does NOT work after installation — any provider,
#                           search backend, TTS engine, or messaging platform you plan to
#                           use must be pre-installed here.
#                           Available extras (see upstream pyproject.toml):
#                             anthropic, exa, firecrawl, parallel-web, fal, edge-tts,
#                             modal, daytona, vercel, hindsight, messaging, cron, slack,
#                             matrix, wecom, tts-premium, voice, wake, honcho, mem0,
#                             vision, pty, mcp, nemo-relay, homeassistant, sms, teams,
#                             computer-use, acp, mistral, otlp, bedrock, vertex,
#                             azure-identity, termux, termux-all, dingtalk, feishu,
#                             google, youtube, web, cli, dev
#                           Example:  HERMES_PIP_EXTRAS="anthropic,messaging,voice" makepkg -si
#   HERMES_BUILD_WHATSAPP=1  Build the whatsapp-bridge Node.js dependencies.
#                           Enable this if you use the WhatsApp integration.
pkgname=hermes-agent
pkgver=0.20.1
_tagver=2026.8.13
pkgrel=1
pkgdesc="Locally-run AI agent with tool use, web browsing, and automation"
arch=('any')
url="https://github.com/NousResearch/hermes-agent"
license=('MIT')
groups=()
depends=(
    'python311'
    'ripgrep'
    'ffmpeg'
    'nss'
    'atk'
    'at-spi2-core'
    'cups'
    'libdrm'
    'libxkbcommon'
    'mesa'
    'pango'
    'cairo'
    'alsa-lib'
)

makedepends=('python311' 'nodejs' 'npm' 'rsync')
source=("https://github.com/NousResearch/hermes-agent/archive/refs/tags/v${_tagver}.tar.gz" "nosdistguard.patch")
sha256sums=('2b202b0cbcecfaeec85572b60d66cd481ca387248b592878bf92204de78abefe'
            'd4849e4997672e4f731770e622c03b1e5cb9ff899f3987df6dfee10346d8cf95')
validpgpkeys=()
install=hermes-agent.install

build() {
  cd "${pkgname}-${_tagver}"

  # vite-plugin-tailwindcss uses the ignore package which walks up the tree to read
  # .gitignore files. Creating an empty .git directory stops the scan at this level.
  [ ! -d .git ] && mkdir .git

  _npm="npm --no-fund --no-audit --progress=false"

  echo "==> Installing Node.js dependencies..."
  if [ -f "package.json" ]; then
    $_npm install || return 1
  fi

  echo "==> Building frontend..."
  if [ -d "web" ]; then
    cd web
    $_npm install || return 1
    $_npm run build || return 1
    cd ..
  fi

  echo "==> Building TUI..."
  # hermes_cli.main sets PROJECT_ROOT to its installed site-packages parent and
  # expects the modern TUI at PROJECT_ROOT/ui-tui. Build that directory here and
  # package it into the venv's site-packages below.
  if [ -d "ui-tui" ]; then
    cd ui-tui
    $_npm install || return 1
    $_npm run build:ink || return 1
    $_npm run build || return 1
    cd ..
  fi

  # Optional: install whatsapp-bridge dependencies
  # Enable with: HERMES_BUILD_WHATSAPP=1
  if [ "${HERMES_BUILD_WHATSAPP:-0}" = "1" ]; then
    echo "==> Installing whatsapp-bridge dependencies..."
    if [ -f "scripts/whatsapp-bridge/package.json" ]; then
      (cd scripts/whatsapp-bridge && $_npm install --legacy-peer-deps --omit=dev) || return 1
    fi
  fi

  echo "==> Creating Python venv and installing dependencies..."
  python3.11 -m venv --clear venv || return 1
  echo "==> disabling distguard to be able to build wheel..."
  patch -p1 < ../nosdistguard.patch
  echo "==> Upgrading pip..."
  venv/bin/pip install --upgrade pip
  echo "==> Installing hermes-agent and its dependencies..."
  venv/bin/pip install .[all]
  echo "==> Installing extra dependencies that cannot be lazily installed later..."
  echo "You may add more dependencies by setting HERMES_PIP_EXTRAS in your environment"
  echo "  e.g. HERMES_PIP_EXTRAS='anthropic,messaging' makepkg -si"
  if [ -n "${HERMES_PIP_EXTRAS}" ]; then
    echo "==> Installing extras: ${HERMES_PIP_EXTRAS}"
    venv/bin/pip install ".[${HERMES_PIP_EXTRAS}]"
  fi

  # Optional: build the Electron desktop app
  # Enable with: HERMES_BUILD_DESKTOP=1 makepkg -si
  if [ "${HERMES_BUILD_DESKTOP:-0}" = "1" ]; then
    echo "==> Building desktop Electron app..."
    cd apps/desktop
    $_npm install || return 1
    $_npm run build || return 1
    $_npm run builder -- --linux dir || return 1
    cd ../..
  fi

}

package() {
  cd "${pkgname}-${_tagver}"

  # Install to /opt
  _optdir="$pkgdir/opt/$pkgname"
  install -d "$_optdir"

  # Copy application files
  rsync -a --exclude='__pycache__' --exclude='.git' \
  --exclude='node_modules' --exclude='web/src' \
  --exclude='web/package.json' --exclude='web/package-lock.json' \
  --exclude='web/vite.config.ts' --exclude='web/tsconfig*.json' \
  --exclude='web/eslint.config.js' --exclude='web/README.md' \
  --exclude='ui-tui/src' --exclude='ui-tui/node_modules' \
  --exclude='scripts/tests' --exclude='scripts/install.*' \
  --exclude='build' \
  . "$_optdir/"

  echo "console.log('skipping build, using prebuilt dist/entry.js')" > "$_optdir/ui-tui/scripts/build.mjs"

  sed -i '1c#!/opt/hermes-agent/venv/bin/python3.11' $_optdir/venv/bin/hermes 

  install -d "$_optdir/venv/lib/python3.11/site-packages"
  {
      echo "import sys; sys.path.insert(0, \"/opt/$pkgname\")"
  } > "$_optdir/venv/lib/python3.11/site-packages/hermes.pth"

  install -d "$pkgdir/usr/bin"
  {
    echo "#!/bin/bash"
    echo "unset PYTHONPATH"
    echo "unset PYTHONHOME"
    echo "exec /opt/$pkgname/venv/bin/hermes" '"$@"'
  } > "$pkgdir/usr/bin/hermes"

  chmod 755 "$pkgdir/usr/bin/hermes"

  # Optional: install the prebuilt desktop app
  if [ "${HERMES_BUILD_DESKTOP:-0}" = "1" ]; then
    echo "==> Installing desktop Electron app..."
    install -d "$_optdir/apps/desktop"
    # Copy the built renderer assets
    if [ -d "apps/desktop/dist" ]; then
      rsync -a "apps/desktop/dist/" "$_optdir/apps/desktop/dist/"
    fi
    # Copy the packaged Linux app (release/linux-unpacked/)
    if [ -d "apps/desktop/release/linux-unpacked" ]; then
      rsync -a "apps/desktop/release/linux-unpacked/" "$_optdir/apps/desktop/release/linux-unpacked/"
    fi
    # Copy assets and package.json (needed by the updater)
    rsync -a --include='package.json' --include='assets/' --exclude='*' \
      "apps/desktop/" "$_optdir/apps/desktop/"
  fi
}
