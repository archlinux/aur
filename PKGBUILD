# Maintainer: Otto Ahoniemi <otto@ottoahoniemi.fi>

pkgname="expo-cli"
pkgver=4.12.1
pkgrel=1
pkgdesc="Tools for creating, running, and deploying Universal Expo and React Native apps"
arch=("any")
url="https://expo.io"
license=("MIT")
depends=("nodejs")
makedepends=("jq" "npm")
optdepends=()
source=("$pkgname-$pkgver.tar.gz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tar.gz")
sha512sums=("6c0db5db10782eec35d051a5aaf081e3bd96659ce52215edd9dbb7f9824fc808243c9cb5f0498f10032be3df0457a7a04529c463974cc74063ddb8cd3a1f345f")

package() {
  npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tar.gz"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "$pkgdir"/usr -type d -execdir chmod 755 {} \+

  # Remove references to pkgdir
  find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

  # Remove references to srcdir
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"

  # Add license
  install -Dm644 "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
