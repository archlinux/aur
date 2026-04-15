# Maintainer: Markus Näther <naether.markus@gmail.com>

pkgname=feynman-cli
pkgver=0.2.17
pkgrel=1
pkgdesc="Open-source AI research agent CLI"
arch=('x86_64')
url="https://github.com/getcompanion-ai/feynman"
license=('MIT')
depends=('nodejs' 'npm')
makedepends=('git' 'pnpm')

source=("$pkgname::git+https://github.com/getcompanion-ai/feynman.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$pkgname"

  export NODE_ENV=production

  pnpm install --no-frozen-lockfile

  # build project
  pnpm run build
}

package() {
  cd "$pkgname"

  install -dm755 "$pkgdir/usr/lib/feynman"
  cp -r . "$pkgdir/usr/lib/feynman"

  install -dm755 "$pkgdir/usr/bin"
  cat << 'EOF' > "$pkgdir/usr/bin/feynman"
#!/bin/sh
exec node /usr/lib/feynman/dist/index.js "$@"
EOF

  chmod +x "$pkgdir/usr/bin/feynman"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
