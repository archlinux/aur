# Maintainer: 
# Contributor: Thiago Almeida <thiagoalmeidasa@gmail.com>
pkgname=nodejs-commitlint
_npmname=${pkgname#nodejs-}
pkgver=14.1.0
pkgrel=1
pkgdesc="Lint your commit messages"
arch=('any')
url="https://commitlint.js.org"
license=('MIT')
depends=('nodejs')
makedepends=('jq' 'npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
sha256sums=('98379dbb8ea73aa3d5c6e64a2a223c3b0cf97e2f8f2598eec80a6b093a1edafd')

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
  mv "$pkgdir/usr/lib/node_modules/$_npmname/license.md" \
    "$pkgdir/usr/share/licenses/$pkgname"
}
