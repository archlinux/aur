# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: Nodejitsu Inc. <info@nodejitsu.com>
# Contributor: indexzero <charlie.robbins@gmail.com>
# Contributor: mmalecki <me@mmalecki.com>
# Contributor: chjj <chjjeffrey@gmail.com>
# Contributor: V1 <info@3rd-Eden.com>

_npmname=winston
pkgname=nodejs-winston # All lowercase
pkgver=3.2.1
pkgrel=1
pkgdesc="A multi-transport async logging library for Node.js"
arch=(any)
url="https://github.com/flatiron/winston"
license=("MIT")
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('85b9340c1b3c4b2b96925fb7589c053ef74f617a847f4d5b0da658af68c53ce7')

package() {
    # Thanks jeremejevs and je-vv for the pointers on these!
    npm install -g --user root --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"

    # Fix permissions
    find "$pkgdir"/usr -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"

    # Remove references to pkgdir
    find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

    # Remove references to srcdir
    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/$_npmname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"
}

# vim:set ts=2 sw=2 et:
