# Maintainer: Stick <stick@stma.is>
pkgname=prettier-plugin-go-template
pkgver=0.0.15
pkgrel=1
pkgdesc='Prettier plugin for formatting Go & GoHugo templates'
arch=('any')
url='https://github.com/NiklasPor/prettier-plugin-go-template'
license=('MIT')
depends=('nodejs' 'prettier')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('f1cacf3058917ecb46deb64c322be4abd57abbfa9f71dac3062ab2f9a83ea319')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"

  # Fix npm permission race condition (https://github.com/npm/npm/issues/9359)
  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  # Fix ownership (https://bugs.archlinux.org/task/63396)
  chown -R root:root "$pkgdir"

  # Remove local paths from package.json
  find "$pkgdir/usr" -name package.json -exec sed -i '/"_where"/d' '{}' '+'
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"

  install -Dm644 "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
