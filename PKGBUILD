# Maintainer: Bruno Galeotti <bgaleotti at gmail dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>

_npmname=redis-commander
pkgname=nodejs-redis-commander
pkgver=0.7.0
pkgrel=2
pkgdesc="Redis management tool written in node.js"
arch=('any')
url="https://joeferner.github.io/redis-commander/"
depends=('nodejs')
license=('MIT')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('12bad786d94793d0b54886e427acd8591f2f762a9b3e78560347c310fb11945f')

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
