# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=bitly-client
pkgver=1.7.2
pkgrel=1
pkgdesc="Create and manage your Bitly shortlinks from the command line"
arch=('x86_64')
url='https://github.com/specious/bitly-client'
license=('ISC')
depends=('nodejs' 'bash')
makedepends=('npm')
noextract=("${pkgname}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('9106390a4c56391bc755acc10177f7e98a80d1a95a08ced483b115995a89a6d8')

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
  install -Dm644 "${pkgdir}/usr/lib/node_modules/bitly-client/node_modules/bitly/LICENCE" \
   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}