# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>
_npmname=jsondiffpatch
pkgname=nodejs-jsondiffpatch
pkgver=0.3.11
pkgrel=1
pkgdesc="diff and patch JavaScript objects (JSON)"
arch=(any)
url="https://github.com/benjamine/jsondiffpatch"
license=(MIT)
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha512sums=('5e2dc8ca076dfc11a19a5e9b754161803922d5380eb29de11b78a21f72adccff826a1b4671d3df2912e59d96d2c3eddbd6e99992198aaea5d481470a7a7ca1b4')

package() {
    npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"

    # Remove references to $pkgdir
    find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

    # Remove references to $srcdir
    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/$_npmname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"
    chmod u=rwX,go=rX -R "$pkgdir/usr/lib/node_modules/$_npmname"
}
