# Maintainer: Ole Reglitzki <dev <plus> nodekey <at> xoria.de>
_npmname=nodekey
pkgname=nodejs-nodekey
pkgver=1.1.0
pkgrel=1
pkgdesc="A Simple interactive CLI password manager, store and generator based on scrypt"
arch=("any")
url="https://gitlab.com/xoria/nodekey/"
license=("GPL3")
depends=("nodejs")
makedepends=("npm" "jq")
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
md5sums=('b20ef5cd6fd9dbc981cc52af23d4586a')
sha1sums=('3e35e7619ba265a292b423ef2131c5d17d4af6c6')
sha256sums=('091de898fcf8eaa0501878967455d2c444996f86ea623e1aedcabb9b0f5260fb')

package() {
  # See https://wiki.archlinux.org/index.php/Node.js_package_guidelines
  npm install -g --user root --production --cache "$srcdir/npm-cache" --prefix "$pkgdir"/usr \
      "$srcdir"/$_npmname-$pkgver.tgz
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
  find "$pkgdir" -name package.json -print0 | xargs -0 sed -i '/_where/d'
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$_npmname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
}
