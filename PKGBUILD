# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=green-tunnel
pkgver=1.7.6
pkgrel=1
pkgdesc='An anti-censorship utility designed to bypass the DPI system that is put in place by various ISPs to block access to certain websites (CLI)'
arch=('any')
url="https://github.com/SadeghHayeri/GreenTunnel"
license=('MIT')
depends=('nodejs')
makedepends=('tar' 'jq')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SadeghHayeri/GreenTunnel/archive/v${pkgver}.tar.gz")
sha256sums=('0f3a1113d0351f37e77cfa203894a49444fabe36822771a1f3d29ab91dc9e282')

package() {
  npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tar.gz"
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  sed -i "s|${pkgdir}||g" "${pkgdir}/usr/lib/node_modules/green-tunnel/node_modules/sshpk/package.json"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}" 
  install -Dm644 "${pkgdir}/usr/lib/node_modules/green-tunnel/LICENSE" \
   -t "${pkgdir}/usr/share/licenses/${pkgname}"
}