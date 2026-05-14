# Maintainer: Vitaliy VVS Star <vitaliy <dot> star <at> Gmail-DOT-Com>

pkgname=deer-flow-git
pkgver=2.0_m1_rc0.r2101.ba864112a
pkgrel=1
pkgdesc="Deep Exploration and Efficient Research Flow — an open-source super agent harness by ByteDance"
arch=('any')
url="https://github.com/bytedance/deer-flow"
license=('MIT')
depends=(
  'python>=3.12'
  'nodejs>=22'
  'nginx'
)
makedepends=('git' 'npm')
optdepends=(
  'docker: sandbox execution mode'
  'kubernetes: sandbox execution with k8s pods'
  'pnpm: frontend package manager (if not using corepack)'
  'uv: python package manager (if not using pipx)'
)
provides=('deer-flow')
conflicts=('deer-flow')
source=(
  'deer-flow::git+https://github.com/bytedance/deer-flow.git#branch=main'
  'deer-flow-nginx.conf'
  'deer-flow-langgraph.service'
  'deer-flow-gateway.service'
  'deer-flow-frontend.service'
  'deer-flow.target'
)
sha256sums=('SKIP'
            '92a63da438377d5804d25b43e4a19957411be07e36618bc130aa26bf0d69675c'
            'a846d2b8d27a8062f811f0b4613bae976a6c14c590a2ba46855b80b4c2de5cee'
            '9dc3bc7fcc61ccb7ae9216ed9876b6d9ea50462d52059710cfdd9416b747e45f'
            'db2eeb2148539afda1d2bb7b0a09bd3d5f9d142f3723f5354c62cb05fff141bc'
            '5a6317f3395de78d31a716fe24bb4ce64596fef0cdbb2fe8e052ffbf695f4e16')
install=deer-flow.install

pkgver() {
  cd "$srcdir/deer-flow"
  _tag=$(git tag --list 'v*' --sort=-version:refname | head -1)
  if [ -n "$_tag" ]; then
    _tag_ver=$(echo "$_tag" | sed 's/^v//' | tr '-' '_')
  else
    _tag_ver="0.0.0"
  fi
  _rev=$(git rev-list --count HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf '%s.r%s.%s' "$_tag_ver" "$_rev" "$_hash"
}

prepare() {
  cd "$srcdir/deer-flow"
  git config --local --add safe.directory "$srcdir/deer-flow" 2>/dev/null || true
}

build() {
  cd "$srcdir/deer-flow"

  export PATH="$srcdir/.local/bin:$PATH"
  mkdir -p "$srcdir/.local/bin"

  if ! command -v uv &>/dev/null; then
    echo "Installing uv locally..."
    curl -LsSf https://astral.sh/uv/install.sh | env UV_INSTALL_DIR="$srcdir/.local/bin" sh
  fi

  if ! command -v pnpm &>/dev/null; then
    echo "Installing pnpm locally..."
    npm install -g --prefix="$srcdir/.local" pnpm
    ln -sf "$srcdir/.local/lib/node_modules/.bin/pnpm" "$srcdir/.local/bin/pnpm"
    ln -sf "$srcdir/.local/lib/node_modules/.bin/pnpx" "$srcdir/.local/bin/pnpx"
  fi

  echo "Installing backend dependencies..."
  (cd backend && uv sync --quiet)

  echo "Installing frontend dependencies and building..."
  (cd frontend && pnpm install --frozen-lockfile 2>/dev/null || pnpm install)
  (cd frontend && pnpm run build)
}

package() {
  _appdir="/opt/deer-flow"

  cd "$srcdir/deer-flow"

  # ── Install application to /opt/deer-flow ──
  install -dm755 "$pkgdir$_appdir"

  # Copy backend (with venv and workspace packages)
  cp -a backend "$pkgdir$_appdir/backend"

  # Copy frontend (with built .next)
  cp -a frontend "$pkgdir$_appdir/frontend"

  # Copy top-level files
  for f in Makefile config.example.yaml extensions_config.example.json .env.example; do
    [ -f "$f" ] && install -Dm644 "$f" "$pkgdir$_appdir/$f"
  done

  # Copy scripts
  cp -a scripts "$pkgdir$_appdir/scripts"

  # Copy skills
  cp -a skills "$pkgdir$_appdir/skills"

  # Copy docs (if exists)
  [ -d docs ] && cp -a docs "$pkgdir$_appdir/docs"

  # Copy docker nginx config as reference
  install -dm755 "$pkgdir$_appdir/docker/nginx"
  install -Dm644 docker/nginx/nginx.local.conf "$pkgdir$_appdir/docker/nginx/nginx.local.conf"

  # ── Install license ──
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # ── Install nginx config ──
  install -Dm644 "$srcdir/deer-flow-nginx.conf" "$pkgdir/etc/nginx/sites-available/deer-flow.conf"

  # ── Install systemd services ──
  install -Dm644 "$srcdir/deer-flow-langgraph.service" "$pkgdir/usr/lib/systemd/system/deer-flow-langgraph.service"
  install -Dm644 "$srcdir/deer-flow-gateway.service" "$pkgdir/usr/lib/systemd/system/deer-flow-gateway.service"
  install -Dm644 "$srcdir/deer-flow-frontend.service" "$pkgdir/usr/lib/systemd/system/deer-flow-frontend.service"
  install -Dm644 "$srcdir/deer-flow.target" "$pkgdir/usr/lib/systemd/system/deer-flow.target"

  # ── Create runtime dirs ──
  install -dm755 "$pkgdir$_appdir/logs"
  install -dm755 "$pkgdir$_appdir/temp"
  install -dm755 "$pkgdir$_appdir/backend/.deer-flow"
  install -dm750 "$pkgdir/etc/deer-flow"
  install -Dm644 /dev/stdin "$pkgdir/etc/deer-flow/config.yaml" <<<'# See /opt/deer-flow/config.example.yaml for full reference
# Copy and edit: cp /opt/deer-flow/config.example.yaml /etc/deer-flow/config.yaml
'
  install -Dm600 /dev/stdin "$pkgdir/etc/deer-flow/.env" <<<'# Add your API keys here
# OPENAI_API_KEY=sk-...
# TAVILY_API_KEY=tvly-...
'
}
