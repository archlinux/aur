# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=eleventy
pkgver=0.11.1
pkgrel=1
pkgdesc="A simpler static site generator. An alternative to Jekyll. Transforms a directory of templates (of varying types) into HTML"
arch=('any')
url='https://www.11ty.dev'
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
noextract=("${pkgname}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/11ty/eleventy/archive/v${pkgver}.tar.gz")
sha256sums=('da3b11bf638982822befcde468da16a3fe0db2c86ca00ac61b09504976e4a6af')

package() {
  npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tar.gz"
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/@11ty/eleventy/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}" 
  install -Dm644 "${pkgdir}/usr/lib/node_modules/@11ty/eleventy/LICENSE" \
   -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
