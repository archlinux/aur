# Maintainer: Carlos Prieto <cprieto.ortiz@gmail.com>

pkgname=roon-mpris-bridge-git
pkgver=r10.g85c3551
pkgrel=1
pkgdesc="Bridge between Roon and MPRIS (via roon-kit)"
arch=('any')
url="https://gitlab.com/teraflops/roon-mpris-bridge"
license=('BSD-3-Clause')
depends=('nodejs' 'roon-kit')
makedepends=('git' 'npm')
source=("${pkgname}::git+https://gitlab.com/teraflops/roon-mpris-bridge.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  npm install --omit=dev
}

package() {
  cd "$srcdir/$pkgname"

  install -dm755 "$pkgdir/usr/lib/node_modules/$pkgname"
  cp -r . "$pkgdir/usr/lib/node_modules/$pkgname"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/roon-mpris-bridge" <<'EOF'
#!/usr/bin/env bash
exec node /usr/lib/node_modules/roon-mpris-bridge-git/roon-mpris-bridge.js "$@"
EOF

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 roon-mpris-bridge.service \
    "$pkgdir/usr/lib/systemd/user/roon-mpris-bridge.service"
}


