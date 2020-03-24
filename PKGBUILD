# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=legit
pkgver=3.0.1
pkgrel=1
pkgdesc="Add licenses to projects at the command line"
arch=('any')
url='https://github.com/captainsafia/legit'
license=('MIT')
makedepends=('npm')
noextract=("v${pkgver}.tar.gz")
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('3954bd2dd6cd78c070716788a10cb633')

package() {
  npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/v${pkgver}.tar.gz"
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/@captainsafia/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
  chown -R root:root "${pkgdir}"
}