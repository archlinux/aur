# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Maintainer: Achilleas Pipinellis <axilleas at archlinux dot gr>

_npmname=markdownlint-cli
pkgname=nodejs-$_npmname
pkgver=0.33.0
pkgrel=1
pkgdesc="MarkdownLint Command Line Interface"
arch=('any')
url="https://github.com/igorshubovych/markdownlint-cli"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')

source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha512sums=('ccc2b5a07a636248633bef78fa7800462041ad10c450cce8a031c1007b6610827da1875d77d977721091798da63e579cc07ee07e5429d40a62953a3ea34ce8a5')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$_npmname-$pkgver.tgz"

  # Fix permissions
  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "$pkgdir"/usr -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"

  # Remove local paths from package.json
  find "${pkgdir}"/usr -name package.json -exec sed -i '/"_where"/d' '{}' '+'
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$_npmname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"

  # Install license
  install -Dm644 "${srcdir}"/package/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
