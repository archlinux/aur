# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=release
pkgver=6.1.0
pkgrel=1
pkgdesc="Generate changelogs with a single command"
arch=('x86_64')
url='https://npmjs.com/release'
license=('MIT')
makedepends=('npm')
noextract=("${pkgname}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zeit/release/archive/${pkgver}.tar.gz")
md5sums=('fd9de7204acac7432236cf6585350702')

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
}