# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

_name=prettier
pkgname=nodejs-$_name
pkgver=1.18.2
pkgrel=1
pkgdesc='An opinionated code formatter'
arch=('any')
url='https://prettier.io/'
license=('MIT')
depends=('nodejs')
makedepends=('jq' 'npm')
source=("https://registry.npmjs.org/$_name/-/$_name-$pkgver.tgz")
sha256sums=('8d16af3cd65f9c2a275a46d69d22cc5cf7a6b0c00015f62507ba23757ffd11ba')

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_name-$pkgver.tgz"
  find "$pkgdir/usr" -type d -exec chmod 755 {} +
  find "$pkgdir" -name package.json -print0 | xargs -0 sed -i '/_where/d'
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$_name/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"

  install -Dm 644 "$srcdir/package/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
