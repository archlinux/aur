# Author: Lukas Grossar <lukas.grossar@gmail.com
# Maintainer: Lukas Grossar <lukas.grossar@gmail.com
_npmname=cz-emoji
pkgname=nodejs-cz-emoji
pkgver=1.3.1
pkgrel=2
pkgdesc="Commitizen plugin to use gitmojis in your commits"
arch=(any)
url="https://github.com/ngryman/cz-emoji"
license=('MIT')
depends=('nodejs' 'nodejs-commitizen')
makedepends=('npm' 'jq')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha512sums=('0112cfc3b438fbb175c7156e62f7ff7367380182693f5c831096feef1c116d70b0fa60d7506497250d33f6ea08ee337ff2cd2e0bb2d50b4640105b8b7c44e6d4')

package() {
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"

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
