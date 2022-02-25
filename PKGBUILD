# Maintainer: Achilleas Pipinellis <axilleas archlinux.info>

_npmname=svgexport
_npmver=0.4.2
pkgname=nodejs-$_npmname
pkgver=$_npmver
pkgrel=1
pkgdesc='Node.js module and command-line tool for exporting SVG to PNG and JPEG.'
arch=(any)
url='https://github.com/shakiba/svgexport'
license=('MIT')
makedepends=('npm' 'phantomjs')
depends=('nodejs')
provides=('nodejs-svgexport')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz")

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$_npmname-$pkgver.tgz"

  # Fix permissions
  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "$pkgdir"/usr -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"

  # Remove local paths from package.json
  find "${pkgdir}"/usr -name package.json -exec sed -i '/"_where"/d' '{}' '+'
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$_npmname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"

  # Install license
  #install -Dm644 "${srcdir}"/package/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha512sums=('119aadeccbea3cce6023a963e21ca5956281a073e23925ab7fa47cc7783ed3323bd506fc39717314399281451a3c606864741992037cca67c344dea4e9903e08')
