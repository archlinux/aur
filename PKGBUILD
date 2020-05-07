# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=alder
pkgver=2.0.0
pkgrel=1
pkgdesc="A minimal implementation of the UNIX tree command with colors!"
arch=('any')
url='https://github.com/aweary/alder'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
noextract=("${pkgname}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aweary/alder/archive/v${pkgver}.tar.gz")
sha256sums=('8303420eb1620801ad81b8f551a51d49353d6feda5da3541adcc15fc58ec088d')

package() {
  npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tar.gz"
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/@aweary/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
  chown -R root:root "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/lib/node_modules/@aweary/alder/LICENSE" \
   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}