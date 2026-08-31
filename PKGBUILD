# Maintainer: Youcef <youcef.nafa@gmail.com>
# Co-maintainer: Evert <evorster at gmail dot com>
# The Python environment is bundled because upstream pins a large, partly native
# dependency set. uv's relocatable mode keeps the packaged environment usable
# after makepkg moves it under /opt.
pkgname=hermes-agent
pkgver=0.21.0
_tagver=2026.8.31
pkgrel=1
pkgdesc="Locally-run AI agent with tool use, web browsing, and automation"
arch=('x86_64')
url="https://github.com/NousResearch/hermes-agent"
license=('MIT')
groups=()
depends=(
    'python311'
    'nodejs'
    'uv'
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

makedepends=('npm' 'rsync')
source=("${pkgname}-${_tagver}.tar.gz::https://github.com/NousResearch/hermes-agent/archive/refs/tags/v${_tagver}.tar.gz")
sha256sums=('78fb3ff707ec1d17044b875ecac8bef28aa39d44242824f6871ca40afe7bf217')
validpgpkeys=()

build() {
  cd "${pkgname}-${_tagver}"

  # vite-plugin-tailwindcss uses the ignore package which walks up the tree to read
  # .gitignore files. Creating an empty .git directory stops the scan at this level.
  [ ! -d .git ] && mkdir .git

  npm ci --ignore-scripts --no-fund --no-audit --progress=false --include=dev
  npm run build --workspace web
  npm run build:ink --workspace ui-tui
  npm run build --workspace ui-tui

  UV_PYTHON_DOWNLOADS=never uv venv \
    --python /usr/bin/python3.11 \
    --relocatable \
    venv
  UV_PYTHON_DOWNLOADS=never \
    UV_PROJECT_ENVIRONMENT="$PWD/venv" \
    uv sync --locked --no-dev --no-install-project --extra all
}

check() {
  cd "${pkgname}-${_tagver}"

  test -s hermes_cli/web_dist/index.html
  test -s ui-tui/dist/entry.js
  PYTHONPATH="$PWD" venv/bin/python -c 'import hermes_cli.main'
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

  # Ship the prebuilt TUI into hermes_cli/tui_dist/ so that
  # _find_bundled_tui() finds it and skips the npm install step (which
  # would fail with EACCES on the root-owned /opt tree).
  # Note: hermes_cli is imported from /opt/hermes-agent/hermes_cli/ via
  # the .pth file, NOT from the venv site-packages, so we copy there.
  _tuidir="$_optdir/hermes_cli/tui_dist"
  install -d "$_tuidir"
  if [ -d "ui-tui/dist" ]; then
    cp -a ui-tui/dist/* "$_tuidir/"
  fi

  install -d "$_optdir/venv/lib/python3.11/site-packages"
  {
      echo "import sys; sys.path.insert(0, \"/opt/$pkgname\")"
  } > "$_optdir/venv/lib/python3.11/site-packages/hermes.pth"

  install -d "$pkgdir/usr/bin"
  {
    echo "#!/bin/bash"
    echo "unset PYTHONPATH"
    echo "unset PYTHONHOME"
    echo ': "${XDG_DATA_HOME:=$HOME/.local/share}"'
    echo 'export HERMES_DISABLE_LAZY_INSTALLS=1'
    echo 'export HERMES_LAZY_INSTALL_TARGET="$XDG_DATA_HOME/hermes-agent/python"'
    echo "exec /opt/$pkgname/venv/bin/python -m hermes_cli.main" '"$@"'
  } > "$pkgdir/usr/bin/hermes"

  chmod 755 "$pkgdir/usr/bin/hermes"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
