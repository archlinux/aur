# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=release-it
pkgver=13.6.0
pkgrel=1
pkgdesc="Automate versioning and package publishing"
arch=('any')
url='https://github.com/release-it/release-it'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
noextract=("${pkgname}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('34676f882afbbdff53270b583397020ae941d11e463140071d6d3792345f8ac0')

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