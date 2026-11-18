pkgname=vercel
pkgver=66.2.0
pkgrel=1
pkgdesc="The command line interface for Vercel"
arch=('x86_64' 'aarch64')
url="https://github.com/vercel/vercel"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
options=('!strip' '!debug')
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha256sums=('ea42258083d304d7f261f8a7d3dc1db23ce64fc00233acbee0772b227d6de7c9')

# For more info about this package see:
# https://wiki.archlinux.org/index.php/Node.js_package_guidelines
package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

  # Fix permissions
  find "$pkgdir"/usr -type d -exec chmod 755 {} +

  # Remove references to pkgdir
  find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

  # Remove references to srcdir
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}
