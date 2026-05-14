# Maintainer: wyf9661 <wyf9661@hotmail.com>
# Contributor: Youcef <youcef.nafa@gmail.com>
# Contributor: Evert <evorster at gmail dot com>
_pkgname=hermes-agent
pkgname=${_pkgname}-git
pkgver=2026.5.7.r576.g6122a7
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
makedepends=('uv' 'nodejs' 'npm' 'git')
provides=(${_pkgname})
conflicts=(${_pkgname})
# Binary is a self-contained Bun executable with embedded JS/resources - stripping breaks it
options=('!strip' '!debug')
source=("git+https://github.com/NousResearch/${_pkgname}.git")
sha256sums=('SKIP')
install=${_pkgname}.install

pkgver() {
  git -C "${srcdir}/${_pkgname}" describe --long --tags --abbrev=6 | sed 's/^v//;s/\([^-]*\)-\([0-9]*\)-\(.*\)/\1.r\2.\3/'
}

build() {
  cd "${_pkgname}"

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
  # Use the system Python (3.14 on Arch) with `python -m venv --copies` to create
  # a fully self-contained venv.  --copies copies the Python binary into the venv
  # and correctly patches all its embedded prefix paths, avoiding the /install
  # hardcoding problem that uv-managed Python has.
  # hermes-agent itself is pure Python and compatible with Python 3.11 .. 3.14.
  python -m venv --copies --clear "$srcdir/${_pkgname}/venv" || return 1
  PYTHONDONTWRITEBYTECODE=1 "$srcdir/${_pkgname}/venv/bin/python" -m pip install -U pip setuptools wheel || return 1
  PYTHONDONTWRITEBYTECODE=1 "$srcdir/${_pkgname}/venv/bin/python" -m pip install .[all] || return 1

  # Detect and persist Python version for package()
  "$srcdir/${_pkgname}/venv/bin/python" -c 'import sys; print(f"python{sys.version_info.major}.{sys.version_info.minor}")' > "$srcdir/_py_ver"
}

package() {
  cd "${_pkgname}"

  # -----------------------------------------------------------------------
  # Python packages -> /opt/hermes-agent/venv/lib/{py_ver}/site-packages/
  # Only ship site-packages (no venv/bin/ which has $srcdir shebangs).
  # -----------------------------------------------------------------------
  _py_ver=$(cat "$srcdir/_py_ver")
  _optdir="$pkgdir/opt/${_pkgname}"
  install -d "$_optdir/venv/lib/${_py_ver}/site-packages"
  cp -r venv/lib/${_py_ver}/site-packages/* "$_optdir/venv/lib/${_py_ver}/site-packages/"

  cp -r web       "$_optdir/"
  cp -r scripts   "$_optdir/"

  # The TUI launcher (hermes_cli/main.py line 1055-1059) checks HERMES_TUI_DIR.
  # When set, it looks for $HERMES_TUI_DIR/dist/entry.js — keep the dist/
  # directory intact so the shortcut path is triggered.
  if [ -d "ui-tui/dist" ]; then
    install -d "$_optdir/venv/lib/${_py_ver}/site-packages/ui-tui/dist"
    cp -a ui-tui/dist/* "$_optdir/venv/lib/${_py_ver}/site-packages/ui-tui/dist/"
  fi

  # NOTE: hermes-agent/package.json exists (for browser tools @askjo/camofox-browser,
  # agent-browser) but we intentionally do NOT copy the resulting node_modules/ to
  # $_optdir because:
  #   1. Native modules (better-sqlite3 etc.) embed $srcdir absolute paths in
  #      their build artefacts, triggering makepkg's $srcdir reference warning
  #   2. They are invoked via subprocess at runtime and are not required at
  #      /opt/hermes-agent/node_modules/ — hermes-agent's Python code does not
  #      import them directly
  #   3. Shipping them would add ~100 MB of unnecessary packages
  # If browser tools are needed at runtime: cd /opt/hermes-agent && npm install
  :

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


  # Install license to /opt/$_pkgname
  install -Dm644 LICENSE "$_optdir/LICENSE"

  # Create simple wrapper script in /usr/bin
  # We ship only venv/lib/{py_ver}/site-packages/, not venv/bin/.
  # So we call the system Python with PYTHONPATH pointing to the site-packages.
  # HERMES_TUI_DIR tells hermes_cli/main.py to use the prebuilt dist/entry.js
  # directly, skipping all npm install / npm run build.
  install -d "$pkgdir/usr/bin"

  # Remove all __pycache__ directories (Python bytecode caches).  They contain
  # embedded $srcdir paths in their .pyc headers.  Python recompiles them on
  # first import and caches the result in ~/.pycache/ (user-owned, no $srcdir).
  find "$pkgdir" -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true

  # Remove direct_url.json files (pip metadata with $srcdir file:// URLs).
  # These are only used by pip for verification/debugging, not needed at runtime.
  find "$pkgdir" -name "direct_url.json" -delete 2>/dev/null || true
  cat > "$pkgdir/usr/bin/hermes" <<WRAPPER
#!/bin/bash
export HERMES_TUI_DIR=/opt/hermes-agent/venv/lib/${_py_ver}/site-packages/ui-tui
export PYTHONPATH=/opt/hermes-agent/venv/lib/${_py_ver}/site-packages
exec /usr/bin/python -m hermes_cli.main "\$@"
WRAPPER
  chmod 755 "$pkgdir/usr/bin/hermes"
}
