# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=yo
pkgver=3.1.0
pkgrel=1
pkgdesc="CLI tool for running Yeoman generators"
arch=('any')
url='http://yeoman.io'
license=('MIT')
makedepends=('npm')
noextract=("v${pkgver}.tar.gz")
source=("https://github.com/yeoman/yo/archive/v${pkgver}.tar.gz")
md5sums=('898281ae7c21d9f214e1866b4d8887a3')

package() {
  npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/v${pkgver}.tar.gz"
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  sed -i "s|${pkgdir}||g" "${pkgdir}/usr/lib/node_modules/${pkgname}/node_modules/sshpk/package.json"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
  chown -R root:root "${pkgdir}"
}