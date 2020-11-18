# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mevn-cli
pkgver=1.8.2
pkgrel=1
pkgdesc="Light speed setup for MEVN(Mongo Express Vue Node) Apps"
arch=('any')
url='https://mevn.madlabs.xyz'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
noextract=("v${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/madlabsinc/mevn-cli/archive/v${pkgver}.tar.gz")
sha256sums=('f2479f65f19210657e209b3581f6ef52ee77b1b207fe90511f47c15c82521896')

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
  install -Dm644 "${pkgdir}/usr/lib/node_modules/mevn-cli/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
