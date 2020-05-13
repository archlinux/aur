# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=legit
pkgver=3.0.1
pkgrel=1
pkgdesc="Add licenses to projects at the command line"
arch=('any')
url='https://github.com/captainsafia/legit'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
noextract=("${pkgname}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ad126242ca1657fe9470712903383c6f588461ad15182734667e760d805ba21b')

package() {
  npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tar.gz"
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/@captainsafia/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
  chown -R root:root "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/lib/node_modules/@captainsafia/legit/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}