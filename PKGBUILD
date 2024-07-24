# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=multiview
pkgver=3.0.0
pkgrel=1
pkgdesc="Spawn multiple processes and channel their outputs into separate little column views."
arch=('any')
depends=('nodejs' 'bash' 'jq')
makedepends=('npm')
url="https://github.com/arjunmehta/multiview"
license=('MIT')
options=('!emptydirs')
source=(https://github.com/arjunmehta/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('4e48be8138ab74be0beb9611a9307997fd4714629532b22b840f72a83f8bdf2c')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir/$pkgver.tar.gz" --cache "${srcdir}/npm-cache"
  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +

  # Remove references to $pkgdir
  find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

  # Remove references to $srcdir
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"

  # Install license since the package doesn't include it
  install -Dm 644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
