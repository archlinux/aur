# Maintainer: icepie <icepie@nicecode.ai>

pkgname=nicecode-tool
pkgver=1.3.4
pkgrel=3
pkgdesc="NiceCode API configuration tool for Claude, CodeX, and Gemini CLI tools"
arch=('any')
url="https://github.com/icepie/nicecode-tools"
provides=('nicecode-tool' 'nicecode')
license=('MIT')
depends=('nodejs>=18.12.0')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('f1a2bfd6c0e09ccc216d0c562e5a5215ade0bba209e0fd78d83b4bd59f8fc8b0')

package() {
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

  # Remove references to $pkgdir
  find "$pkgdir/usr" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

  # Remove references to $srcdir
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  # Install license
  install -Dm644 "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
