# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=dockly
pkgver=3.14.4
pkgrel=1
pkgdesc="Immersive terminal interface for managing docker containers and services"
arch=('any')
url='https://lirantal.github.io/dockly/'
license=('MIT')
makedepends=('npm')
noextract=("v${pkgver}.tar.gz")
source=("https://github.com/lirantal/dockly/archive/v${pkgver}.tar.gz")
md5sums=('636718b622aecfda5fe126ae96e8cc63')

package() {
  npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/v${pkgver}.tar.gz"
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
  chown -R root:root "${pkgdir}"
}