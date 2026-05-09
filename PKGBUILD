# Maintainer: Youcef <youcef.nafa@gmail.com>
# Co-maintainer: Evert <evorster at gmail dot com>
pkgname=hermes-agent
pkgver=0.13.0
_tagver=2026.5.7
pkgrel=1
pkgdesc="Locally-run AI agent with tool use, web browsing, and automation"
arch=('any')
url="https://github.com/NousResearch/hermes-agent"
license=('MIT')
groups=()
depends=(
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

makedepends=('uv' 'nodejs' 'npm')
source=("https://github.com/NousResearch/hermes-agent/archive/refs/tags/v${_tagver}.tar.gz")
sha256sums=('75b629e787a68164713b66d1dd163c65f853474c9c775cd6f206797a629aa2c0')
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

  echo "==> Creating Python 3.11 venv and installing dependencies..."
  uv venv --python 3.11 --clear venv || return 1
  source venv/bin/activate
  uv pip install .[all] 
}

package() {
  cd "${pkgname}-${_tagver}"

  # Install to /opt
  _optdir="$pkgdir/opt/$pkgname"
  install -d "$_optdir"

  # Copy application files
  cp -r venv "$_optdir/"
  cp -r web "$_optdir/"
  cp -r scripts "$_optdir/"

  # The TUI launcher uses PROJECT_ROOT/ui-tui, where PROJECT_ROOT is the venv's
  # site-packages directory (/opt/hermes-agent/venv/lib/python3.11/site-packages
  # for this package). Put the prebuilt ui-tui tree there so hermes --tui does
  # not try to npm-install from a missing directory at runtime.
  if [ -d "ui-tui" ]; then
    _site_packages="$(find "$_optdir/venv/lib" -type d -name site-packages -print -quit)"
    install -d "$_site_packages"
    cp -a ui-tui "$_site_packages/"
  fi

  # Copy node_modules if present (kept alongside app for same path)
  if [ -d "node_modules" ]; then
    cp -r node_modules "$_optdir/"
  fi

  # Install optional submodule if present
  if [ -d "tinker-atropos" ]; then
    cp -r tinker-atropos "$_optdir/"
  fi

  # Install skills directory if present
  if [ -d "skills" ]; then
    cp -r skills "$_optdir/"
  fi

  # Install configuration examples
  [ -f "cli-config.yaml.example" ] && install -Dm644 cli-config.yaml.example "$_optdir/cli-config.yaml.example"
  [ -f ".env.example" ] && install -Dm644 .env.example "$_optdir/.env.example"


  # Install license to /opt/$pkgname
  install -Dm644 LICENSE "$_optdir/LICENSE"

  # Create simple wrapper script in /usr/bin
  install -d "$pkgdir/usr/bin"
  echo "#!/bin/bash" > "$pkgdir/usr/bin/hermes"
  echo "exec /opt/$pkgname/venv/bin/python -m hermes_cli.main" '"$@"' >> "$pkgdir/usr/bin/hermes"
  chmod 755 "$pkgdir/usr/bin/hermes"
}
