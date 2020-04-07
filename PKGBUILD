# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>
_npmname=commitizen
pkgname=nodejs-commitizen
pkgver=4.0.4
pkgrel=1
pkgdesc="Git plugin to help you write consistent commit messages"
arch=(any)
url="https://github.com/commitizen/cz-cli"
license=(MIT)
depends=('nodejs>=10')
makedepends=('npm' 'jq')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha512sums=('81f12dd6b0c4f55a8a89ff8b1377004e1a6a896ff52b7736371f378d253aa2166341dd82026cf5acc2258266cfacf6a03a4299c3b512cd256e6d2ef9f194d674')

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
