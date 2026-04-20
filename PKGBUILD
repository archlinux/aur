# Maintainer: Markus Näther <naether.markus@gmail.com>

pkgname=feynman-cli
pkgver=0.2.40
pkgrel=1
pkgdesc="Open-source AI research agent CLI"
arch=('x86_64')
url="https://github.com/getcompanion-ai/feynman"
license=('MIT')
depends=('nodejs' 'npm')
makedepends=('git' 'npm')

source=("$pkgname::git+https://github.com/getcompanion-ai/feynman.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  
  #pwd

  #export NODE_ENV=production

  npm ci
  
  npm run build
}

package() {
  cd "$pkgname"
  
  install -dm755 "$pkgdir/usr/lib/feynman"
  cp -r . "$pkgdir/usr/lib/feynman"

  install -dm755 "$pkgdir/usr/bin"
  cat << 'EOF' > "$pkgdir/usr/bin/feynman"
#!/bin/sh
# Ensure writable directories
export FEYNMAN_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/feynman"
export FEYNMAN_CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/feynman"

mkdir -p "$FEYNMAN_HOME" "$FEYNMAN_CACHE"

exec node /usr/lib/feynman/dist/index.js "$@"
EOF

  chmod +x "$pkgdir/usr/bin/feynman"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
