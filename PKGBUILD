# Maintainer: Your Name <your.email@example.com>
pkgname=domainarr
pkgver=0.0.1
pkgrel=1
pkgdesc="DNS sync CLI for Pi-hole and Cloudflare"
arch=('x86_64' 'aarch64')
url="https://github.com/ryanbas21/domainarr"
license=('ISC')
depends=('nodejs>=20')
makedepends=('pnpm' 'npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ryanbas21/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')  # Update with actual checksum for release

build() {
  cd "$pkgname-$pkgver"
  pnpm install --frozen-lockfile
  pnpm build
}

package() {
  cd "$pkgname-$pkgver"

  # Install to /usr/lib/domainarr
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp -r dist node_modules package.json "$pkgdir/usr/lib/$pkgname/"

  # Create wrapper script
  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/bin/sh
exec node /usr/lib/domainarr/dist/main.js "$@"
EOF
  chmod +x "$pkgdir/usr/bin/$pkgname"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
