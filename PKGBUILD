# Maintainer: Adam Smith <adam at adamsm dot com>

pkgname=instamancer
pkgver=3.3.1
pkgrel=1
pkgdesc="Scrape Instagram's API with Puppeteer."
arch=('x86_64')
url="https://github.com/scriptsmith/instamancer"
license=('MIT')
# Includes dependencies from google-chrome package
depends=('nodejs' 'alsa-lib' 'gtk3' 'libcups' 'libxss' 'libxtst' 'nss')
makedepends=('npm' 'jq')
install='instamancer.install'
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha256sums=('b7e97d33f01ff2e7a3d1cb72a53239ed3b1b4ab87da7300defc48cef1cab7cd4')

# Taken from https://wiki.archlinux.org/index.php/Node.js_package_guidelines
package() {
  npm install \
    --ignore-scripts \
    --user root --global \
    --prefix "$pkgdir/usr" \
    "$srcdir"/$pkgname-$pkgver.tgz

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +

  # Remove references to $pkgdir
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

  # Remove references to $srcdir
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  # Install license since the package doesn't include it
  install -Dm0644 "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


