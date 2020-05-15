# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=scaffold-static
pkgver=1.8.6
pkgrel=1
pkgdesc="Scaffolding utility for vanilla-js"
arch=('any')
url='https://www.npmjs.com/package/scaffold-static'
license=('GPL3')
depends=('nodejs')
makedepends=('npm')
noextract=("${pkgname}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jamesgeorge007/scaffold-static/archive/v${pkgver}.tar.gz")
sha256sums=('f593032f46fcd7c582ae2af02d963a0e2d2cc573045810b891ac8181f8ee82b0')

package() {
  npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tar.gz"
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
  chown -R root:root "${pkgdir}"
}