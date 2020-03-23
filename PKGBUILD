# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mevn-cli
pkgver=1.6.5
pkgrel=1
pkgdesc="Light speed setup for MEVN(Mongo Express Vue Node) Apps"
arch=('any')
url='https://mevn.madlabs.xyz'
license=('MIT')
makedepends=('npm')
noextract=("v${pkgver}.tar.gz")
source=("https://github.com/madlabsinc/mevn-cli/archive/v${pkgver}.tar.gz")
md5sums=('4f7f71a62985e9a2208fa48c4fa7ecd3')

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