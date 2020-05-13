# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mobicon-cli
pkgver=3.0.0
pkgrel=1
pkgdesc="Mobile icon generator"
arch=('any')
url='https://github.com/SamVerschueren/mobicon-cli'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
noextract=("${pkgname}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6a067aab4fdfebe1ed357a41e7b612da808cd5a1b24733d088336aaed79ed12b')

package() {
  npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tar.gz"
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
  install -Dm644 "${pkgdir}//usr/lib/node_modules/mobicon-cli/license" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}