# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>
_npmname=jsondiffpatch
pkgname=nodejs-jsondiffpatch
pkgver=0.4.1
pkgrel=1
pkgdesc="diff and patch JavaScript objects (JSON)"
arch=(any)
url="https://github.com/benjamine/jsondiffpatch"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha512sums=('b747ad0314d4935c3931874d3a464167caef61837988bfb6747082c7f0e99059bf6d6dbc33acb99d44bcdc3e17759887cb7e45a5ac3a2c16fe17cf1f1d99d50b')

package() {
    npm install -g  --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"

    # Remove references to $pkgdir
    find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

    # Remove references to $srcdir
    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/$_npmname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"
    chmod u=rwX,go=rX -R "$pkgdir"
    chown -R root:root "$pkgdir"
}
