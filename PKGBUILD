# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=add-gitignore
pkgver=1.1.1
pkgrel=2
pkgdesc="An interactive CLI tool that adds a .gitignore to your projects"
arch=('any')
url='https://www.npmjs.com/package/add-gitignore'
license=('MIT')
makedepends=('npm')
noextract=("v${pkgver}.tar.gz")
source=("https://github.com/TejasQ/add-gitignore/archive/v${pkgver}.tar.gz")
md5sums=('0012ee64c22985ee7bfd844f438747fd')

package() {
  npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/v${pkgver}.tar.gz"
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  sed -i "s|${pkgdir}||g" "${pkgdir}/usr/lib/node_modules/add-gitignore/node_modules/sshpk/package.json"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
}