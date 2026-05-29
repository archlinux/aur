# Maintainer: Youcef <youcef.nafa@gmail.com>
# Co-maintainer: Evert <evorster at gmail dot com>
# This package uses a venv-based installation inspired by the official NousResearch install.sh. It swaps off uv with python311's venv since python 3.11 is the latest version supported by the developer. The venv solution allows the inclusion of all nodejs modules inside the package's /opt as opposed to shipping the package following ArchLinux convensions (/usr/share,/usr/lib,/usr/bin).
# Optional dependencies are dissociated from arch and need to be installed manually into venv. Although, many are installed by hermes lazyly when needed.
# TODO: there needs to be a way to copy skills upon hermes package update, or, at least, to prompt the user to do so.
pkgname=hermes-agent
pkgver=0.15.2
_tagver=2026.5.29.2
pkgrel=2
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

makedepends=('python311' 'nodejs' 'npm')
source=("https://github.com/NousResearch/hermes-agent/archive/refs/tags/v${_tagver}.tar.gz")
sha256sums=('465ee7a8da014d89e8d381fd13b862469862b7aa6d42b2e9b938351d3787b48e')
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

  cp -r hermes_cli/dashboard_auth venv/lib/python3.11/site-packages/hermes_cli/
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
  cp -r locales "$_optdir/"
  cp -r plugins "$_optdir/"
  cp -r optional-mcps "$_optdir/"
  cp -r optional-skills "$_optdir/"
  cp -r plans "$_optdir/"

  # The TUI launcher uses PROJECT_ROOT/ui-tui, where PROJECT_ROOT is the venv's
  # site-packages directory. Put the prebuilt ui-tui tree there so hermes --tui does
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

  # Create simple wrapper script in /usr/bin.
  # Set HERMES_TUI_DIR so the launcher uses the prebuilt bundle without
  # trying to rebuild via esbuild at runtime (which would fail on the
  # root-owned site-packages tree).
  install -d "$pkgdir/usr/bin"
  {
    echo "#!/bin/bash"
    echo "export HERMES_TUI_DIR=/opt/$pkgname/venv/lib/\$(/opt/$pkgname/venv/bin/python3.11 -c 'import sys; print(\"python{}.{}\".format(*sys.version_info[:2]))')/site-packages/ui-tui"
    echo "exec /opt/$pkgname/venv/bin/python3.11 -m hermes_cli.main" '"$@"'
  } > "$pkgdir/usr/bin/hermes"

  chmod 755 "$pkgdir/usr/bin/hermes"
}
