# Maintainer: Ivan Chebykin <ivan@chebykin.org>
pkgname=typespec
_pkgsubname=compiler
pkgver=0.59.1
pkgrel=1
pkgdesc="Compiler CLI for TypeSpec"
arch=('any')
url="https://npmjs.com/package/@$pkgname/$_pkgsubname"
license=('MIT')
depends=('npm')
makedepends=('jq')
noextract=($_pkgsubname-$pkgver.tgz)
source=("https://registry.npmjs.org/@$pkgname/$_pkgsubname/-/$_pkgsubname-$pkgver.tgz")
sha256sums=('ad71672732e7ee5cc87b46322dcf1cc43a4a168619f2df08091ee3222e5709f8')

# For more info about this package see:
# https://wiki.archlinux.org/index.php/Node.js_package_guidelines
package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$_pkgsubname-$pkgver.tgz"

  # Fix permissions
  find "$pkgdir"/usr -type d -exec chmod 755 {} +

  # Remove references to pkgdir
  find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

  # Remove references to srcdir
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/@$pkgname/$_pkgsubname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}
