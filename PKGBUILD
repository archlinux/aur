# Maintainer: Luke Bubar <luke at coldmail dot xyz>

pkgname=mcp-searxng
pkgver=2.4.0
pkgrel=1
pkgdesc="MCP server that gives AI assistants web search and page reading through a SearXNG instance"
arch=('any')
url="https://github.com/ihor-sokoliuk/mcp-searxng"
license=('MIT')
depends=('nodejs>=22')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
# Fails on purpose until you run updpkgsums (the build machine had no network to compute it).
sha256sums=('6ca4f9314ead3b01c348a69617dd3d5e27a48cb63885e59b3bc093229312de1d')

package() {
  npm install -g \
    --cache "$srcdir/npm-cache" \
    --no-audit --no-fund \
    --prefix "$pkgdir/usr" \
    "$srcdir/$pkgname-$pkgver.tgz"

  # npm leaves files owned by the build user and some directories world-writable
  chown -R root:root "$pkgdir"
  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  install -Dm644 "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
