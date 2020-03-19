# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=aurelia-cli
pkgver=1.3.0
pkgrel=1
pkgdesc="The Aurelia 1 command line tool. Use the CLI to create projects, scaffold components, and bundle your app for release"
arch=('any')
url='https://github.com/aurelia/cli'
license=('MIT')
depends=('perl')
makedepends=('npm')
noextract=("${pkgver}.tar.gz")
source=("${url}/archive/${pkgver}.tar.gz")
md5sums=('SKIP')

package() {
  cd "${srcdir}"
  mkdir ${srcdir}/npm-cache
  npm install --cache "${srcdir}/npm-cache" -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgver}.tar.gz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
  chown -R root:root "${pkgdir}"
}