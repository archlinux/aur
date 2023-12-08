# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: zoorat <zoorat [at] protonmail [dot] com>

pkgname=terser
pkgver=5.26.0
pkgrel=1
pkgdesc='JavaScript parser, mangler and compressor toolkit for ES6+'
arch=('any')
url='https://terser.org/'
license=('BSD')
depends=('nodejs')
makedepends=('jq' 'npm')
provides=('nodejs-terser')
conflicts=('nodejs-terser')
replaces=('nodejs-terser')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('7c88a5187a351eb7e298a6593619f3cf0bcf8122ea13a27f143938d8ede75d77')

package() {
  # based on https://wiki.archlinux.org/index.php/Node.js_package_guidelines as of 2021-09-30
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  # fix package containing reference to $srcdir/$pkgdir
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"

  find "$pkgdir" -type f -name package.json | while read pkgjson; do
    local tmppackage="$(mktemp)"
    jq 'del(.man)' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"
  done

  # package specific
  install -Dm 644 "$srcdir/package/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
