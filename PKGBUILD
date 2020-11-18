# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=release
pkgver=6.3.0
pkgrel=1
pkgdesc="Generate changelogs with a single command"
arch=('any')
url='https://npmjs.com/release'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
noextract=("${pkgname}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zeit/release/archive/${pkgver}.tar.gz")
sha256sums=('d1aeb340cebd39e8552ee0b5e7a2a3a8df95a3b29a97119e73ace43e96ef5ad1')

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
  install -Dm644 "${pkgdir}/usr/lib/node_modules/release/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
