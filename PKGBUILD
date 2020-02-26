_npmname=now
pkgname=nodejs-$_npmname
pkgver=17.0.4
pkgrel=1
pkgdesc="The command line interface for Zeit Now"
arch=(any)
url="https://github.com/zeit/now-cli"
license=('MIT')
depends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('f8009a78b1589b1df2a14b23dab79a7c2924d999a4389175a91bc3e6811cab19')

# For more info about this package see:
# https://wiki.archlinux.org/index.php/Node.js_package_guidelines
package() {
  # If we don't unlink the binary the script below will fail to run
  # https://github.com/zeit/now/blob/60c76b32902a73efaff75368e266ae9efac71eb0/packages/now-cli/scripts/preinstall.js
  sudo unlink /usr/bin/now || true

  npm install -g --user root --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"

  # Fix permissions
  find "$pkgdir"/usr -type d -exec chmod 755 {} +

  # Remove references to pkgdir
  find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

  # Remove references to srcdir
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$_npmname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
}
