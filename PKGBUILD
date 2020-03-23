# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mobicon-cli
pkgver=3.0.0
pkgrel=1
pkgdesc="Mobile icon generator"
arch=('any')
url='https://github.com/SamVerschueren/mobicon-cli'
license=('MIT')
makedepends=('npm')
noextract=("v${pkgver}.tar.gz")
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('f1e62e5c65da7214c52160b5bd52296c')

package() {
  npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/v${pkgver}.tar.gz"
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
}