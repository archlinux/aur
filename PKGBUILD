# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

_name=prettier
pkgname=nodejs-$_name
pkgver=1.19.1
pkgrel=1
pkgdesc='An opinionated code formatter'
arch=('any')
url='https://prettier.io/'
license=('MIT')
depends=('nodejs')
makedepends=('jq' 'npm')
source=("https://registry.npmjs.org/$_name/-/$_name-$pkgver.tgz")
sha256sums=('c766f70d74c9340bdb6a834993634d27e4bedac7e0193e10a969ce155ab8bf1d')

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
