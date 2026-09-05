# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=revolut-x-mcp
pkgver=1.0.49
pkgrel=1
pkgdesc="Read-only MCP server for the Revolut X crypto exchange"
arch=('any')
url="https://github.com/revolut-engineering/revolut-x-api"
license=('MIT')
depends=('nodejs>=20')
source=(
  "$pkgname-$pkgver.mcpb::https://github.com/revolut-engineering/revolut-x-api/releases/download/v${pkgver}/revolutx-mcp.mcpb"
  "$pkgname-wrapper"
)
noextract=("$pkgname-$pkgver.mcpb")
sha256sums=('aa2052607d648b14f642abc27da96294238e526da37eed433ed9ff77ce55e3e4'
            '743d6fd897f4f5a9e21917c9793e4d137f95f4497cf761cb3fa94f0997189ef1')

latestver() {
  curl -fsSL 'https://api.github.com/repos/revolut-engineering/revolut-x-api/releases/latest' |
    sed -nE 's/^[[:space:]]*"tag_name":[[:space:]]*"v?([^"]+)".*/\1/p'
}

package() {
  local _destdir="$pkgdir/usr/lib/$pkgname"

  install -d "$_destdir"
  bsdtar -xf "$srcdir/$pkgname-$pkgver.mcpb" -C "$_destdir"
  install -Dm755 "$srcdir/$pkgname-wrapper" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$_destdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm "$_destdir/LICENSE"
  chown -R root:root "$pkgdir"
}
