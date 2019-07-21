# Author: Lukas Grossar <lukas.grossar@gmail.com
# Maintainer: Lukas Grossar <lukas.grossar@gmail.com
_npmname=cz-conventional-changelog
pkgname=nodejs-cz-conventional-changelog
pkgver=3.0.2
pkgrel=1
pkgdesc="Commitizen plugin for conventional changelogs commit messages"
arch=(any)
url="https://github.com/commitizen/cz-conventional-changelog"
license=(MIT)
depends=('nodejs>=10' 'nodejs-commitizen')
makedepends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha512sums=('30fc4445bb50c95a749e7a42062c332862a63014acc26095dc9a5e7f7031a9de5fddcfd239ce9516249495c94ec995c19f75ed7f8b27cede0ed798414d16f680')

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
