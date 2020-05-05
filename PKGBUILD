# Author: Lukas Grossar <lukas.grossar@gmail.com
# Maintainer: Lukas Grossar <lukas.grossar@gmail.com
_npmname=cz-conventional-changelog
pkgname=nodejs-cz-conventional-changelog
pkgver=3.2.0
pkgrel=1
pkgdesc="Commitizen plugin for conventional changelogs commit messages"
arch=(any)
url="https://github.com/commitizen/cz-conventional-changelog"
license=(MIT)
depends=('nodejs>=10' 'nodejs-commitizen')
makedepends=('npm' 'jq')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha512sums=('c80631786a558b6ee1a888a51b59e1e00f419f1e09dcebfe797cb89282f776bad1f883bd19a58fb0a8e2936d21b7ad3c02caa2f1340f7f499cce111ec80b4cce')

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
    chmod u=rwX,go=rX,go-w -R "$pkgdir/usr/lib/node_modules/$_npmname"
}
