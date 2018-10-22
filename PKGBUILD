# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>
_npmname=commitizen
pkgname=nodejs-commitizen
pkgver=3.0.4
pkgrel=1
pkgdesc="Git plugin to help you write consistent commit messages"
arch=(any)
url="https://github.com/commitizen/cz-cli"
license=(MIT)
depends=('nodejs')
makedepends=('npm' 'jq')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha512sums=('76347917b441b0600bc94126fc1d47ffce67b0de0bd45e4385637ef7f79f4b0a870d2ca1c3630ae8c176551b83dba3d4a869106dc52560eeb56ed9135a372357')

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
}
