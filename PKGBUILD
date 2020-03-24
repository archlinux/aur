# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=strip-css-comments-cli
pkgver=2.0.2
pkgrel=1
pkgdesc="Strip comments from CSS"
arch=('any')
url='https://github.com/sindresorhus/strip-css-comments-cli'
license=('MIT')
makedepends=('npm')
noextract=("v${pkgver}.tar.gz")
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('a929d908f33b46b53d1d77bb55b82dc9')

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