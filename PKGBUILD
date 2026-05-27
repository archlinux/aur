# Maintainer: wyf9661 <wyf9661@hotmail.com>
# Contributor: Youcef <youcef.nafa@gmail.com>
# Contributor: Evert <evorster at gmail dot com>
_pkgname=hermes-agent
pkgname=${_pkgname}-git
pkgver=2026.5.16.r1095.gbb4703c
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
makedepends=('nodejs' 'npm' 'git')
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
    npm install || return 1
    npm run build || return 1
    cd ..
  fi

  echo "==> Building TUI..."
  if [ -d "ui-tui" ]; then
    cd ui-tui
    npm install --no-fund --no-audit --progress=false || return 1
    npm run build || return 1
    cd ..
    # Upstream pyproject.toml bundles tui_dist/ in the wheel at
    # hermes_cli/tui_dist/entry.js — the main.py TUI launcher detects
    # it automatically (no HERMES_TUI_DIR env var needed).
    mkdir -p hermes_cli/tui_dist
    cp ui-tui/dist/entry.js hermes_cli/tui_dist/entry.js
  fi

  echo "==> Installing whatsapp-bridge dependencies..."
  if [ -f "scripts/whatsapp-bridge/package.json" ]; then
    (cd scripts/whatsapp-bridge && npm install --legacy-peer-deps --omit=dev) || return 1
  fi

  echo "==> Creating Python venv and installing dependencies..."
  # Use the system Python (3.14 on Arch) with `python -m venv --copies` to create
  # a fully self-contained venv.  --copies copies the Python binary into the venv
  # and correctly patches all its embedded prefix paths, avoiding the /install
  # hardcoding problem that uv-managed Python has.
  # hermes-agent itself is pure Python and compatible with Python 3.11 .. 3.14.
  python -m venv --copies --clear "$srcdir/${_pkgname}/venv" || return 1
  PYTHONDONTWRITEBYTECODE=1 "$srcdir/${_pkgname}/venv/bin/python" -m pip install -U pip setuptools wheel || return 1
  # Use specific extras instead of [all] — [all] in v0.14.0 includes [dev]
  # (pytest, debugpy, ruff) which are unnecessary at runtime.
  PYTHONDONTWRITEBYTECODE=1 "$srcdir/${_pkgname}/venv/bin/python" -m pip install .[cli,pty,mcp,acp,web,cron,homeassistant,sms,google,youtube] || return 1

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

  cp -r scripts "$_optdir/"

  # The upstream main.py:1304 auto-detects tui_dist/entry.js bundled in
  # the hermes_cli package (via pyproject.toml [tool.setuptools.package-data]).
  # No need for a separate ui-tui/dist/ copy or HERMES_TUI_DIR env var.

  # Install browser tool dependencies directly at the package path.
  # Building here avoids $srcdir references in native modules (better-sqlite3).
  cp package.json "$_optdir/"
  echo "==> Installing browser tool dependencies..."
  (cd "$_optdir" && npm install --omit=dev)
  # Remove build artifacts that embed $pkgdir paths — only the compiled
  # .node binaries are needed at runtime, not config.gypi / Makefile / .deps.
  find "$_optdir/node_modules" -path '*/build/Makefile' -delete 2>/dev/null || true
  find "$_optdir/node_modules" -path '*/build/config.gypi' -delete 2>/dev/null || true
  find "$_optdir/node_modules" -path '*/build/Release/.deps' -exec rm -rf {} + 2>/dev/null || true
  find "$_optdir/node_modules" -path '*/build/Release/obj.target' -exec rm -rf {} + 2>/dev/null || true

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

  # Create wrapper script in /usr/bin
  # We ship only venv/lib/{py_ver}/site-packages/, not venv/bin/.
  # So we call the system Python with PYTHONPATH pointing to the site-packages.
  # TUI is auto-detected from hermes_cli/tui_dist/entry.js inside the package
  # (main.py:1304), so no HERMES_TUI_DIR needed.
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
export PYTHONPATH=/opt/hermes-agent/venv/lib/${_py_ver}/site-packages
exec /usr/bin/python -m hermes_cli.main "\$@"
WRAPPER
  chmod 755 "$pkgdir/usr/bin/hermes"
}
