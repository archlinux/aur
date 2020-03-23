# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=scaffold-static
pkgver=1.5.0
pkgrel=1
pkgdesc="Scaffolding utility for vanilla-js"
arch=('any')
url='https://www.npmjs.com/package/scaffold-static'
license=('GPL-3.0')
makedepends=('npm')
noextract=("v${pkgver}.tar.gz")
source=("https://github.com/jamesgeorge007/scaffold-static/archive/v${pkgver}.tar.gz")
md5sums=('27522b905344fb01a625195376b6d4a4')

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