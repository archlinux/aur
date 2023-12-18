# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>
_npmname=jsondiffpatch
pkgname=nodejs-jsondiffpatch
pkgver=0.6.0
pkgrel=1
pkgdesc="diff and patch JavaScript objects (JSON)"
arch=(any)
url="https://github.com/benjamine/jsondiffpatch"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha512sums=('dd022d24e5e9d803f5bafef068191aa399c2be112ff9098901ddfc61babbc0d23be10f810669cb9f81032b3eb223dc46008428505f3ba87b7e91cd48571078cd')

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
