# Maintainer: f.menning@pm.me
# Contributer: Felix Yan <felixonmars@archlinux.org>
# Contributer: gardenapple@posteo.net

_npmname=@soketi/soketi
pkgname=soketi
pkgdesc='Just another simple, fast, and resilient open-source WebSockets server.'
pkgver=0.20.0
pkgrel=1
arch=('any')
url='https://github.com/soketi/soketi'
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
source=(https://registry.npmjs.org/$_npmname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tar.gz)
sha512sums=('4f878a5d0e9797c6e036a0844024c0c44c84276efa7a1af5af74ac40dcac38b2d08c5619d51e63c299f4ae5b432d42ac9c3ebc23f556f261e8109489f27ba1c2')

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

  find "$pkgdir" -type f -name package.json | while read pkgjson; do
      local tmppackage="$(mktemp)"
      jq 'del(.man)' "$pkgjson" > "$tmppackage"
      mv "$tmppackage" "$pkgjson"
      chmod 644 "$pkgjson"
  done
}
