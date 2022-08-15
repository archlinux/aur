# Maintainer: Francois M.
# Contributer: Felix Yan <felixonmars@archlinux.org>
# Contributer: gardenapple@posteo.net

_npmname=@soketi/soketi
pkgname=soketi
pkgdesc='Just another simple, fast, and resilient open-source WebSockets server.'
pkgver=1.3.0
pkgrel=2
arch=('any')
url='https://github.com/soketi/soketi'
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
source=(https://registry.npmjs.org/$_npmname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tar.gz)
sha512sums=('8253a944522b839d50c4a77f9f45a063f71f03effcf00d925e5c232e4857ecb5f6c80533f649ffb02ad9554612829490d6a63806026243304f3d4a1de88b1175')

# see: https://wiki.archlinux.org/index.php/Node.js_package_guidelines

package() {
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  chmod -R u=rwX,go=rX "$pkgdir"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"

  # Remove references to $pkgdir
  find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

  # Remove references to $srcdir
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$_npmname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
}
