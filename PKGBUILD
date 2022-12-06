# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>
_npmname=commitizen
pkgname=nodejs-commitizen
pkgver=4.2.6
pkgrel=1
pkgdesc="Git plugin to help you write consistent commit messages"
arch=(any)
url="https://github.com/commitizen/cz-cli"
license=('MIT')
depends=('nodejs>=10')
makedepends=('npm' 'jq')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha512sums=('4724ccf84883f463b4d432549fd3114407addd750719fa1466892c2dfafed729b55eddaae44609b3d160d81b4a49be4ca39de2d01b4c06658c1d05d5959fcbf7')

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
