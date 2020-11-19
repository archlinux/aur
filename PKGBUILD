# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=release-it
pkgver=14.2.1
pkgrel=1
pkgdesc="Automate versioning and package publishing"
arch=('any')
url='https://github.com/release-it/release-it'
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
noextract=("${pkgname}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('b7021e6ebb08e8e33d897889c2445b244c164669ee920cf6231812f029d74f10')

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
  install -Dm644 "${pkgdir}/usr/lib/node_modules/release-it/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
