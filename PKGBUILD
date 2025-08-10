# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: Kyle Laker <kyle+aur at laker dot email>
pkgname=marp-cli
pkgver=4.2.3
pkgrel=1
pkgdesc="A CLI interface for Marp and Marpit based converters"
url="https://github.com/marp-team/${pkgname}"
arch=(x86_64)
license=(MIT)
makedepends=(npm jq)
optdepends=('chromium: PDF/PPTX/image conversion'
  'google-chrome: PDF/PPTX/image conversion')
depends=(nodejs)
conflicts=(marp-cli-bin)
replaces=(marp)
options=('!strip')
source=(https://registry.npmjs.org/@marp-team/${pkgname}/-/${pkgname}-${pkgver}.tgz)
b2sums=('3c44617aae2cd098b2c5325f803ad7dd7b3d5fd084c9095268099438b78db6e794aeda8b02ecae1308dc8033e9cf85f838fc47ce5fb5c9c2a08e1bab18c85785')
# I may need to extract it for installing license.
#noextract=("${pkgname}-${pkgver}.tgz")

package() {
  npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$srcdir/${pkgname}-${pkgver}.tgz"
  #    chmod -R go-w "$pkgdir/usr"
  find "$pkgdir/usr" -type d -exec chmod 755 {} +
  chown -R root:root "$pkgdir/usr"

  # Remove references to $pkgdir
  find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

  # Remove references to $srcdir
  local tmppackage="$(mktemp)"
  # local tmppackage
  local pkgjson="$pkgdir/usr/lib/node_modules/@marp-team/${pkgname}/package.json"
  # local pkgjson

  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" >"$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"

  # Install MIT license
  install -Dm644 "$srcdir/package/LICENSE" -t "$pkgdir/usr/share/licenses/${pkgname}"
}
