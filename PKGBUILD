# Maintainer: Chris Werner Rau <aur@cwrau.io>

pkgname=capi-shell-mcp
pkgver=1.0.0 # renovate: datasource=github-releases depName=cwrau/capi-shell-mcp
pkgrel=1
pkgdesc="MCP provider for capi-shell — exec into cluster-api workload clusters"
url="https://github.com/cwrau/$pkgname"
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
install="$pkgname.install"
provides=('capo-shell-mcp')
conflicts=('capo-shell-mcp')
replaces=('capo-shell-mcp')
# CI (npm pack, with the 4 runtime deps declared as bundledDependencies)
# uploads a fully self-contained release asset -- node_modules and all, so
# a plain global npm install needs no network and no separate dependency
# resolution. contrib/systemd/ and config.example.yaml aren't in that
# tarball (not runtime files), so pull those from the source archive of the
# same tag.
_ci_asset="$pkgname-$pkgver.tgz"
_srcdir="$pkgname-$pkgname-v$pkgver"
source=(
  "$_ci_asset::https://github.com/cwrau/$pkgname/releases/download/$pkgname-v$pkgver/$_ci_asset"
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgname-v$pkgver.tar.gz"
)
sha256sums=('86be76ac450f92450611a5b64b9614618d4fea1363d048f706d495196ede032c'
            '7a56bdcd3b2cc6390183abfa1bb46b3094097da8a2615d3b2ece1b6d901bbf7f')

package() {
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$_ci_asset"
  chmod go-w -R "$pkgdir"

  cd "$srcdir/$_srcdir"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 config.example.yaml "$pkgdir/usr/share/doc/$pkgname/config.example.yaml"

  install -dm755 "$pkgdir/usr/lib/systemd/user"
  install -m644 contrib/systemd/$pkgname.service contrib/systemd/$pkgname-config.path \
    contrib/systemd/$pkgname-config.service "$pkgdir/usr/lib/systemd/user/"
}
