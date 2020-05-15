# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=strip-css-comments-cli
pkgver=2.0.2
pkgrel=1
pkgdesc="Strip comments from CSS"
arch=('any')
url='https://github.com/sindresorhus/strip-css-comments-cli'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
noextract=("${pkgname}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('aae5bd9c9ec4895b5954329a97725a426917f5f607ec3c76153985089e2755e8')

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
  install -Dm644 "${pkgdir}/usr/lib/node_modules/strip-css-comments-cli/license" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}