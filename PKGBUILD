# Author: Lukas Grossar <lukas.grossar@gmail.com
# Maintainer: Lukas Grossar <lukas.grossar@gmail.com
_npmname=cz-conventional-changelog
pkgname=nodejs-cz-conventional-changelog
pkgver=3.0.3
pkgrel=1
pkgdesc="Commitizen plugin for conventional changelogs commit messages"
arch=(any)
url="https://github.com/commitizen/cz-conventional-changelog"
license=(MIT)
depends=('nodejs>=10' 'nodejs-commitizen')
makedepends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha512sums=('138446b8525c545749cbe7803cf22ff3cc74b1f34ab91435073b77f7aedad27abef031fab3387b9b410bf4a09e5493259790170f3dd9438da849b0877a619480')

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
