# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=dockly
pkgver=3.22.2
pkgrel=2
pkgdesc="Immersive terminal interface for managing docker containers and services"
arch=('any')
url='https://lirantal.github.io/dockly'
license=('MIT')
depends=('nodejs'
         'libx11')
makedepends=('npm' 'jq')
conflicts=('nodejs-live-server')
noextract=("${pkgname}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lirantal/dockly/archive/v${pkgver}.tar.gz")
sha256sums=('fb49515a592c3c85070e4fd76b6df47bb01a17a025ae09e0669d64b0bcca79a1')

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
  install -Dm644 "${pkgdir}/usr/lib/node_modules/dockly/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
