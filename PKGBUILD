# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Ivan Fonseca <ivanfon@riseup.net>
pkgname=fkill
_npmname=fkill-cli
pkgver=8.0.0
pkgrel=1
pkgdesc="Fabulously kill processes. Cross-platform."
arch=('any')
url="https://github.com/sindresorhus/fkill-cli"
license=('MIT')
depends=('nodejs>=18')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
sha256sums=('47be11adbcb1524213aea291a829640c13f93381324fc00bbe059805166da40c')

package() {
  npm install \
    --cache "$srcdir/npm-cache" \
    -g \
    --prefix "$pkgdir"/usr \
    "$srcdir"/$_npmname-$pkgver.tgz

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/cli/issues/1103 for details.
  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  # Remove references to $pkgdir
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

  # Remove references to $srcdir
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$_npmname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  mv "$pkgdir/usr/lib/node_modules/$_npmname/license" \
    "$pkgdir/usr/share/licenses/$pkgname"
}
