# Maintainer: Felix Höffken <felix at ctrl.alt.coop>
# Contributor: Christoph Gysin <christoph.gysin@gmail.com>

_npmname=@feathersjs/cli
_npmver=5.0.26
_srcname="cli-${_npmver}.tgz"
pkgname=nodejs-feathers-cli
pkgver=${_npmver}
pkgrel=0
pkgdesc="The command line interface for Feathers applications"
arch=(any)
url="https://github.com/feathersjs/feathers-cli#readme"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/${_npmname}/-/${_srcname})
noextract=(${_srcname})
sha256sums=('dc74ec802bd39f4f17805d1c7b7979943091586e419604f58b9bf039e37e6e6f')

package() {
  npm install --cache "${srcdir}/npm-cache" -g --user root --prefix "$pkgdir/usr" "$srcdir/${_srcname}"
  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  # Remove references to $pkgdir
  find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

  # Remove references to $srcdir
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/${_npmname}/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
}

# vim:set ts=2 sw=2 et:
