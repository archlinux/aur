# Maintainer: Ivan Fonseca <ivanfon@riseup.net>

# NPM package name
_npmname=fkill-cli

pkgname=fkill
pkgver=6.0.1
pkgrel=1
pkgdesc="Fabulously kill processes. Cross-platform."
arch=(any)
url="https://github.com/sindresorhus/fkill-cli"
license=(MIT)
depends=('nodejs')
makedepends=('jq' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('d60a19bcfddc9d043c57418cb4440450abdfcf9b407c88d1ec66d3ac9eabc316')

# see: https://wiki.archlinux.org/index.php/Node.js_package_guidelines

package() {
  npm install \
    --global \
    --user root \
    --prefix "$pkgdir"/usr \
    --cache "${srcdir}/npm-cache" \
    "$srcdir"/$_npmname-$pkgver.tgz

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user 
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  # Remove local paths from package.json
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$_npmname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
}

# vim:set ts=2 sw=2 et:

