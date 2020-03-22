# Maintainer: Ivan Fonseca <ivanfon[at]riseup[dot]net>
# Contributor: John D Jones III jnbek1972 __AT__ $mailservice_by_google __DOT__ com

_npmname=tldr

pkgname=nodejs-tldr
pkgver=3.3.2
pkgrel=1
pkgdesc="Simplified and community-driven man pages"
arch=(any)
url="https://github.com/tldr-pages/tldr"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('7ce51ebe2340f7b49bf221d2efdd381e5f74bd7274cb207c795a5a75c61e12b9')

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

