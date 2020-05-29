# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=yo
pkgver=3.1.1
pkgrel=1
pkgdesc="CLI tool for running Yeoman generators"
arch=('any')
url='http://yeoman.io'
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
noextract=("${pkgname}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/yeoman/yo/archive/v${pkgver}.tar.gz")
sha256sums=('b035b81eb5586722f472331906fd9389947d45c891d9cd620b856d747f6b488c')

package() {
  npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tar.gz"
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  sed -i "s|${pkgdir}||g" "${pkgdir}/usr/lib/node_modules/${pkgname}/node_modules/sshpk/package.json"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
  chown -R root:root "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/lib/node_modules/yo/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}