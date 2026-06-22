# Maintainer: Chris Werner Rau <aur@cwrau.io>

pkgname=capo-shell-mcp
pkgver=0.1.0 # renovate: datasource=github-releases depName=cwrau/capo-shell-mcp
pkgrel=1
pkgdesc="MCP provider for capo-shell — exec into cluster-api workload clusters"
url="https://github.com/cwrau/$pkgname"
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7335093e950b0012b23fd27fb111f933afebfd8c361ba6917ea592fdf6a4de8e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  npm install
  npm run build
  npm prune --omit=dev
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp -r dist node_modules package.json "$pkgdir/usr/lib/$pkgname/"
  find "$pkgdir/usr/lib/$pkgname/dist" \( -name '*.d.ts' -o -name '*.js.map' \) -delete
  rm -rf "$pkgdir/usr/lib/$pkgname/dist/__tests__"

  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/bin/sh
exec node /usr/lib/capo-shell-mcp/dist/index.js "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/$pkgname"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 config.example.yaml "$pkgdir/usr/share/doc/$pkgname/config.example.yaml"
}
