# Maintainer: Oskar Carl <oskar@traubenuss.de>

pkgname=fyrlang
pkgver=0.1.4
pkgrel=1
pkgdesc="Versatile, safe, and modern systems programming language."
arch=('any')
url="https://github.com/vs-ude/fyr"
license=('BSD')
depends=('nodejs' 'gcc')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('6ba62ad3035a4b27176fd4d36081148c767f970deff9734bcc69032a28e38207')

package() {
  # install production dependencies; this will also recompile the runtime using gcc
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

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

  # install the license, as it is recommended for BSD
  install -Dm644 "$srcdir/package/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

  # link the fyrc binary to amke it accessible
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/usr/lib/node_modules/$pkgname/bin/fyrc" "${pkgdir}/usr/bin/fyrc"
}

# vim:set ts=2 sw=2 et:
