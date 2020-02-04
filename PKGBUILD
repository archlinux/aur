# Author: Lukas Grossar <lukas.grossar@gmail.com
# Maintainer: Lukas Grossar <lukas.grossar@gmail.com
_npmname=cz-emoji
pkgname=nodejs-cz-emoji
pkgver=1.1.2
pkgrel=2
pkgdesc="Commitizen plugin to use gitmojis in your commits"
arch=(any)
url="https://github.com/ngryman/cz-emoji"
license=(MIT)
depends=('nodejs' 'nodejs-commitizen')
makedepends=('npm' 'jq')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha512sums=('81b528805034d00bcf4feb2a7233e7a4b67cb7947949e4451f0cdb6f2be6269c7ce7d54c2c916ad10b5417c0f604fc5c8e5d394d4319a6e25f83bc04125151f4')

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
