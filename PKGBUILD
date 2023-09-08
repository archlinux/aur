# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>
_npmname=jsondiffpatch
pkgname=nodejs-jsondiffpatch
pkgver=0.5.0
pkgrel=1
pkgdesc="diff and patch JavaScript objects (JSON)"
arch=(any)
url="https://github.com/benjamine/jsondiffpatch"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha512sums=('42ecf732f0301f1558357b0e0722fbc48e4407659839e16cc2a687200dea38ade2b11593c62a65044a1c9a6aeee979b10c1d8bee30cd62d600e05ca29a800513')

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
