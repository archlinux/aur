# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=jspm-cli
pkgver=2.0.0.beta.7
pkgrel=2
pkgdesc="A JavaScript package manager designed to
work seamlessly with native modules in universal workflows,
while providing full compatibility with the npm ecosystem."
arch=('any')
url='https://jspm.org'
license=('Apache2')
makedepends=('npm')
noextract=("2.0.0-beta.7.tar.gz")
source=("https://github.com/jspm/jspm-cli/archive/2.0.0-beta.7.tar.gz")
md5sums=('6973ea9fdfed2531cd5686b154fa29ec')

package() {
  cd "${srcdir}"
  mkdir ${srcdir}/npm-cache
  npm install --cache "${srcdir}/npm-cache" -g --user root --prefix "${pkgdir}/usr" "${srcdir}/2.0.0-beta.7.tar.gz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  sed -i "s|${pkgdir}||g" "${pkgdir}/usr/lib/node_modules/jspm/node_modules/sshpk/package.json"
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/jspm/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
  chown -R root:root "${pkgdir}"
}