# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=eleventy
pkgver=0.11.0
pkgrel=1
pkgdesc="A simpler static site generator. An alternative to Jekyll. Transforms a directory of templates (of varying types) into HTML"
arch=('any')
url='https://www.11ty.dev'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
noextract=("${pkgname}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/11ty/eleventy/archive/v${pkgver}.tar.gz")
sha256sums=('ff7e919da0232866b14ae357e298b697f92bbf79775fffb89da80ba9f9348e7d')

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