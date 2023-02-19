# Maintainer:  RogueGirl <3a33oxx40 at mozmail dot com>


pkgname=green-tunnel
pkgver=1.8.3
pkgrel=2
pkgdesc='An anti-censorship utility designed to bypass the DPI system that is put in place by various ISPs to block access to certain websites (CLI)'
arch=('any')
url="https://github.com/SadeghHayeri/GreenTunnel"
license=('MIT')
depends=('nodejs')
makedepends=('tar' 'jq' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SadeghHayeri/GreenTunnel/archive/v${pkgver}.tar.gz")
sha256sums=('a543e48e5421e7a5e0a078bb339413d50ceae3dd393ef9bb3046b6bfb35715f5')

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
