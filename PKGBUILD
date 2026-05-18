# Maintainer: VVS <vvs@noreply.example.com>
pkgname=ai-trader-git
pkgver=r337.754a3b4
pkgrel=1
pkgdesc="100% Fully-Automated Agent-Native Trading Platform"
arch=('any')
url="https://github.com/HKUDS/AI-Trader"
license=('MIT')
depends=('python')
makedepends=('git' 'python-pip' 'python-virtualenv' 'npm' 'nodejs')
optdepends=(
  'postgresql: PostgreSQL database backend'
  'redis: Caching and background task queue'
)
provides=('ai-trader')
conflicts=('ai-trader')
install=ai-trader.install
backup=('etc/ai-trader/.env')
source=(
  'git+https://github.com/HKUDS/AI-Trader.git'
  'ai-trader.service'
  'ai-trader-worker.service'
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/AI-Trader"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/AI-Trader"

  # Build frontend
  cd service/frontend
  npm ci --no-audit --no-fund
  npm run build
  cd -

  # Patch requirements
  sed -i 's/openrouter>=1.0.0/openrouter>=0.9.0/' service/requirements.txt
  sed -i '/^pytest/d' service/requirements.txt
  echo 'email-validator>=2.1.0' >> service/requirements.txt
}

package() {
  cd "$srcdir/AI-Trader"

  # Install application to /opt/ai-trader
  install -dm755 "$pkgdir/opt/ai-trader"

  # Copy server source
  install -dm755 "$pkgdir/opt/ai-trader/service/server"
  install -dm755 "$pkgdir/opt/ai-trader/service/server/data"
  install -dm755 "$pkgdir/opt/ai-trader/service/server/logs"
  cp -r service/server/*.py "$pkgdir/opt/ai-trader/service/server/"

  # Copy frontend (source + built dist)
  cp -r service/frontend "$pkgdir/opt/ai-trader/service/"

  # Copy skills, docs, assets
  cp -r skills "$pkgdir/opt/ai-trader/"
  cp -r docs "$pkgdir/opt/ai-trader/"
  cp -r research "$pkgdir/opt/ai-trader/"
  cp -r assets "$pkgdir/opt/ai-trader/"

  # Copy top-level files
  install -Dm644 .env.example "$pkgdir/opt/ai-trader/.env.example"
  install -Dm644 .gitignore "$pkgdir/opt/ai-trader/.gitignore"

  # Create virtualenv in-place and install dependencies
  python -m venv "$pkgdir/opt/ai-trader/.venv"
  "$pkgdir/opt/ai-trader/.venv/bin/pip" install --no-cache-dir -r service/requirements.txt

  # Install config
  install -Dm644 .env.example "$pkgdir/etc/ai-trader/.env"

  # Install systemd services
  install -Dm644 "$srcdir/ai-trader.service" "$pkgdir/usr/lib/systemd/system/ai-trader.service"
  install -Dm644 "$srcdir/ai-trader-worker.service" "$pkgdir/usr/lib/systemd/system/ai-trader-worker.service"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}
