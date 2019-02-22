# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>
_npmname=commitizen
pkgname=nodejs-commitizen
pkgver=3.0.7
pkgrel=2
pkgdesc="Git plugin to help you write consistent commit messages"
arch=(any)
url="https://github.com/commitizen/cz-cli"
license=(MIT)
depends=('nodejs')
makedepends=('npm' 'jq')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha512sums=('da3f04f08935a5ed49ab2d604354b31190c909daf422d8ef85b5e60ea873d7ce90dee911a101cc064982aa6b056267c399c84192b397575db7f664de5c43c929')

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
    chmod u=rwX,go=rX -R "$pkgdir/usr/lib/node_modules/$_npmname/"
}
