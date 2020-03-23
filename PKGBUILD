# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=alder
pkgver=2.0.0
pkgrel=1
pkgdesc="A minimal implementation of the UNIX tree command with colors!"
arch=('any')
url='https://github.com/aweary/alder'
license=('MIT')
makedepends=('npm')
noextract=("v${pkgver}.tar.gz")
source=("https://github.com/aweary/alder/archive/v${pkgver}.tar.gz")
md5sums=('66ea33c2df58e7779a4a9141fd17532f')

package() {
  npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/v${pkgver}.tar.gz"
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/@aweary/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
  chown -R root:root "${pkgdir}"
}