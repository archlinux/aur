# Maintainer: Francois M.
# Contributer: Felix Yan <felixonmars@archlinux.org>
# Contributer: gardenapple@posteo.net

_npmname=@soketi/soketi
pkgname=soketi
pkgdesc='Just another simple, fast, and resilient open-source WebSockets server.'
pkgver=0.33.3
pkgrel=1
arch=('any')
url='https://github.com/soketi/soketi'
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
source=(https://registry.npmjs.org/$_npmname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tar.gz)
sha512sums=('6bc60e4d5c15edadbbe516226fd12d9cb7683c3ebbee7e8671b6c8443d0608729b52ec8bead60807b6cd80a9ce0f7bf31522f195be7c8d598022af95d571d2ee')

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
