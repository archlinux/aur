# Author: Lukas Grossar <lukas.grossar@gmail.com
# Maintainer: Lukas Grossar <lukas.grossar@gmail.com
_npmname=cz-emoji
pkgname=nodejs-cz-emoji
pkgver=1.2.2
pkgrel=1
pkgdesc="Commitizen plugin to use gitmojis in your commits"
arch=(any)
url="https://github.com/ngryman/cz-emoji"
license=('MIT')
depends=('nodejs' 'nodejs-commitizen')
makedepends=('npm' 'jq')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha512sums=('edac183fd52b3d8e4d359aee2cecca1ed1a80cb41b50c6e65eae9b8e7416d66f7699d23ea5268a1a9f37bc9e7ba045af3ea33104341c1d38da0c8849d9f13c31')

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
    chmod u=rwX,go=rX -R "$pkgdir"
    chown -R root:root "$pkgdir"
}
