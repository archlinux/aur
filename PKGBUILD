# Maintainer: Tiago Seabra <tiagolseabra at gmail dot com>

pkgname=lighthouse

pkgver=11.5.0
pkgrel=1

pkgdesc='Automated auditing, performance metrics, and best practices for the web'
arch=(any)
url='https://github.com/GoogleChrome/lighthouse'
license=(Apache)

depends=(nodejs)
makedepends=(npm jq)

source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")

sha256sums=('2f43a6e3eed05f67b84be4ef1ba10180fbf7782252bdf54bdccee2f2dbdd8496')

package() {
  npm install -g \
    --cache "$srcdir/npm-cache" \
    --prefix "$pkgdir/usr" \
    "$srcdir/$pkgname-$pkgver.tgz"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  # remove references to $pkgdir
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

  # remove references to $srcdir
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
}
