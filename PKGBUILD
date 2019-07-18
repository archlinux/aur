# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>
_npmname=commitizen
pkgname=nodejs-commitizen
pkgver=3.1.2
pkgrel=1
pkgdesc="Git plugin to help you write consistent commit messages"
arch=(any)
url="https://github.com/commitizen/cz-cli"
license=(MIT)
depends=('nodejs')
makedepends=('npm' 'jq')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha512sums=('783d2e4d4b2882ef24b058c5158abbe4b2df5de2d7b0221adbb4cf7ceaaf048fad0b1d4fa7941f2aa0bda02faa4e94b3de74e7f7ffbb4cbe6613fc2eac1db625')

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
