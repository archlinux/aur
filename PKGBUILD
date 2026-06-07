# Maintainer: Youcef <youcef.nafa@gmail.com>
# Co-maintainer: Evert <evorster at gmail dot com>
# This package uses a venv-based installation inspired by the official NousResearch install.sh. It swaps off uv with python311's venv since python 3.11 is the latest version supported by the developer. The venv solution allows the inclusion of all nodejs modules inside the package's /opt as opposed to shipping the package following ArchLinux convensions (/usr/share,/usr/lib,/usr/bin).
# Optional dependencies are dissociated from arch and need to be installed manually into venv. Although, many are installed by hermes lazyly when needed.
# TODO: there needs to be a way to copy skills upon hermes package update, or, at least, to prompt the user to do so.
pkgname=hermes-agent
pkgver=0.16.0
_tagver=2026.6.5
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
source=("https://github.com/NousResearch/hermes-agent/archive/refs/tags/v${_tagver}.tar.gz")
sha256sums=('09ae9eef4ea88d3a6689b2071e7c927a4a2ee10e737c0974afd5a19402c090ee')
validpgpkeys=()
install=hermes-agent.install

build() {
  cd "${pkgname}-${_tagver}"

  # vite-plugin-tailwindcss uses the ignore package which walks up the tree to read
  # .gitignore files. Creating an empty .git directory stops the scan at this level.
  [ ! -d .git ] && mkdir .git

  echo "==> Installing Node.js dependencies..."
  if [ -f "package.json" ]; then
    npm install || return 1
  fi

  echo "==> Building frontend..."
  if [ -d "web" ]; then
    cd web
    rm -f package-lock.json
    npm install || return 1
    npm run build || return 1
    cd ..
  fi

  echo "==> Building TUI..."
  # hermes_cli.main sets PROJECT_ROOT to its installed site-packages parent and
  # expects the modern TUI at PROJECT_ROOT/ui-tui. Build that directory here and
  # package it into the venv's site-packages below.
  if [ -d "ui-tui" ]; then
    cd ui-tui
    npm install --no-fund --no-audit --progress=false || return 1
    npm run build || return 1
    cd ..
  fi

  echo "==> Installing whatsapp-bridge dependencies..."
  # Install whatsapp-bridge dependencies (kept alongside scripts for same path)
  if [ -f "scripts/whatsapp-bridge/package.json" ]; then
    (cd scripts/whatsapp-bridge && rm -f package-lock.json && npm install --legacy-peer-deps --omit=dev) || return 1
  fi

  echo "==> Creating Python venv and installing dependencies..."
  python3.11 -m venv --clear venv || return 1
  venv/bin/pip install .[all]
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
  . "$_optdir/"

  # Create simple wrapper script in /usr/bin.
  # Set HERMES_TUI_DIR so the launcher uses the prebuilt bundle without
  # trying to rebuild via esbuild at runtime (which would fail on the
  # root-owned site-packages tree).
  install -d "$pkgdir/usr/bin"
  {
    echo "#!/bin/bash"
    echo "exec /opt/$pkgname/venv/bin/python -m hermes_cli.main" '"$@"'
  } > "$pkgdir/usr/bin/hermes"

  chmod 755 "$pkgdir/usr/bin/hermes"
}
