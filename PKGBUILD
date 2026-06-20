# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Codex (GPT-5.3).

pkgname=sbv
pkgver=0.1.11
pkgrel=1
pkgdesc="Web viewer for SMS Backup & Restore XML files"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='https://github.com/lowcarbdev/sbv'
license=('MIT')
depends=('bash' 'glibc')
makedepends=('go' 'npm')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lowcarbdev/sbv/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('53c056806888eb27f361cb3145b41ff152c984c9e503308c60f945a1d22aa864')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  npm --prefix frontend ci
  npm --prefix frontend run build

  go build -trimpath -tags "fts5" -ldflags "-s -w" -o sbv .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 sbv "$pkgdir/usr/lib/$pkgname/sbv"
  cp -a frontend/dist "$pkgdir/usr/lib/$pkgname/frontend/"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/usr/bin/env bash
set -euo pipefail

export DB_PATH_PREFIX="${DB_PATH_PREFIX:-$HOME/.local/share/sbv}"
mkdir -p "$DB_PATH_PREFIX/data"
cd /usr/lib/sbv
exec /usr/lib/sbv/sbv "$@"
EOF
}
