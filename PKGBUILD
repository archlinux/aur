# Maintainer: Chris Icenhour <chris@randomlinux.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=coinmon
pkgver=0.0.27
pkgrel=2
pkgdesc='Cryptocurrency price monitoring tool'
arch=('any')
url=https://github.com/bichenkk/coinmon
license=('MIT')
depends=('nodejs' 'jq')
makedepends=('npm')
source=("https://registry.npmjs.org/coinmon/-/coinmon-$pkgver.tgz")
noextract=("${source[@]##*/}")
sha512sums=('68ec43cb7a0052ee682a98dbf99ad080eb93fb204fc5b68e73808c2c3f9cf2e2b20db02875fff45de7b9df156286a790b63bdd097b33a009cc36d2a277efccac')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr --ignore-scripts --production coinmon-$pkgver.tgz

  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  mv $pkgdir/usr/lib/node_modules/$pkgname/LICENSE $pkgdir/usr/share/licenses/$pkgname/

  chown -R root:root "$pkgdir/usr/"

  # Remove references to $pkgdir
  find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

  # Remove unneeded files
  find $pkgdir/usr/lib/node_modules/coinmon -maxdepth 1 -type f -not -name package.json -delete

  # Remove references to $srcdir
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"

  chmod 755 $pkgdir/usr/bin
  find $pkgdir/usr/lib/node_modules -type d -exec chmod 755 {} +
}
