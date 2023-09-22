# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Achilleas Pipinellis <axilleas at archlinux dot gr>

pkgname=markdownlint-cli
pkgver=0.37.0
pkgrel=2
pkgdesc="MarkdownLint Command Line Interface"
arch=(any)
url="https://github.com/igorshubovych/markdownlint-cli"
license=(MIT)
depends=(nodejs)
makedepends=(
  npm
  jq
)

source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('5c6ed9557e18e09ae7f014f619072bd413f0c87c6d20c8adc2cf7ff3f383c4d6')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"

  # Fix permissions
  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  # Remove local paths from package.json
  find "$pkgdir/usr" -name package.json -exec sed -i '/"_where"/d' '{}' '+'
  local tmppackage
  tmppackage=$(mktemp)
  local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"

  # Install license
  install -Dm644 "$srcdir/package/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
