pkgname=wallstreet
_pkgname=wallstreet
pkgver=r41.8c966fa
pkgrel=1
pkgdesc="Stock quotes and charts for the terminal"
arch=('any')
url="https://github.com/madnight/wallstreet"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'git' 'jq')
source=("git+https://github.com/madnight/wallstreet.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  npm install -g --user root --prefix "$pkgdir/usr" git+file://$(realpath $_pkgname)
  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  # Remove references to $pkgdir
  find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

  # Remove references to $srcdir
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$_pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
  chown -R root:root "$pkgdir"

  install -Dm 644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
