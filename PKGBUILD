# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=dockly
pkgver=3.17.1
pkgrel=1
pkgdesc="Immersive terminal interface for managing docker containers and services"
arch=('any')
url='https://lirantal.github.io/dockly'
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
noextract=("${pkgname}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lirantal/dockly/archive/v${pkgver}.tar.gz")
sha256sums=('477f60eaaa715010ff618701cf4365e84e3f6bdefe0e7d92191838a0826cb5ba')

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