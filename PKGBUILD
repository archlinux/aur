_npmname=madoko
pkgname=nodejs-"$_npmname"
pkgver=1.1.4
pkgrel=1
pkgdesc=''
arch=('any')
url='https://www.madoko.net/'
license=('Apache-2')
depends=('nodejs')
makedepends=('nodejs' 'npm' 'jq')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha256sums=('0ac4e5a22016dc697a6e1f9a3bbd410ee7b003161c22cd04dded1e7ded18bce9')
noextract=("${source[@]##*/}")

package() {
    npm install -g --prefix "$pkgdir/usr" "${source[@]##*/}"

    # Sanitize npm
    # Fix permissions
    find "$pkgdir/usr" -type d -exec chmod 755 {} +

    # Remove references to $pkgdir
    find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

    # Remove references to $srcdir
    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/$_npmname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"

    # Install license since the package doesn't include it
    # install -Dm 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_npmname/LICENSE"
}
