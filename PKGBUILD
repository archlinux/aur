# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from GLM 5.3 Flash.

pkgname=sbv
pkgver=0.1.13
pkgrel=1
pkgdesc="Web viewer for SMS Backup & Restore XML files"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='https://github.com/lowcarbdev/sbv'
license=('MIT')
depends=('bash' 'glibc')
makedepends=('go' 'npm')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lowcarbdev/sbv/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0b04871b945e48197acb2b3a55959253036602e2ceebad31cf4eb3b4a9f0c34d')

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
