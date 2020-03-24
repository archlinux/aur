# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=bitly-client
pkgver=1.7.2
pkgrel=1
pkgdesc="Create and manage your Bitly shortlinks from the command line"
arch=('x86_64')
url='https://github.com/specious/bitly-client'
license=('MIT')
makedepends=('npm')
noextract=("${pkgname}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('49ce0af9fb2ad2a257c4c086c11e6aa6')

package() {
  npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tar.gz"
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  sed -i "s|${pkgdir}||g" "${pkgdir}/usr/lib/node_modules/${pkgname}/node_modules/sshpk/package.json"
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
  chown -R root:root "${pkgdir}"
}