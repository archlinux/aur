# Maintainer: Youcef <youcef.nafa@gmail.com>
pkgname=hermes-agent
pkgver=0.11.0
_tagver=2026.4.23
pkgrel=2
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
sha256sums=('1ee1be80a2112b7edc581770cee8858e725ba110cc423979cd7102492504bc6b')
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
  if [ -d "tui" ]; then
    cd tui
    rm -f package-lock.json
    npm install || return 1
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
 uv pip install setuptools wheel build || return 1
  #python -m build --wheel --no-isolation || return 1
  #uv pip install dist/*.whl || return 1

  # Install the package directly
  uv pip install -e '.'
}

package() {
  cd "${pkgname}-${_tagver}"

  # Install to /opt
  _optdir="$pkgdir/opt/$pkgname"
  install -d "$_optdir"

  # Copy application files
  cp -r venv "$_optdir/"
  cp -r dist "$_optdir/"
  cp -r web "$_optdir/"
  [ -d "tui" ] && cp -r tui "$_optdir/"
  cp -r scripts "$_optdir/"

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
  cat > "$pkgdir/usr/bin/hermes" << 'EOF'
#!/bin/bash
exec /opt/$pkgname/venv/bin/python -m hermes_cli.main "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/hermes"
}
